<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CartController extends AbstractController
{
    #[Route('/cart', name: 'cart_index', methods: ['GET'])]
    public function index(ProductRepository $productRepository, Request $request): Response
    {
        $cart = $request->getSession()->get('cart', []);
        $items = [];
        $total = 0.0;

        foreach ($cart as $productId => $quantity) {
            $product = $productRepository->find((int) $productId);

            if (!$product instanceof Product) {
                continue;
            }

            $quantity = max(1, (int) $quantity);
            $lineTotal = $product->getPrice() * $quantity;
            $total += $lineTotal;

            $items[] = [
                'product' => $product,
                'quantity' => $quantity,
                'lineTotal' => $lineTotal,
            ];
        }

        return $this->render('cart/index.html.twig', [
            'items' => $items,
            'total' => $total,
        ]);
    }

    #[Route('/cart/add/{id}', name: 'cart_add', methods: ['POST'])]
    public function add(Product $product, Request $request): Response
    {
        if (!$this->isCsrfTokenValid('cart_add_' . $product->getId(), $request->request->get('_token'))) {
            throw $this->createAccessDeniedException('Jeton CSRF invalide.');
        }

        $session = $request->getSession();
        $cart = $session->get('cart', []);
        $productId = (string) $product->getId();

        $cart[$productId] = ($cart[$productId] ?? 0) + 1;
        $session->set('cart', $cart);

        $this->addFlash('success', sprintf('%s a été ajouté au panier.', $product->getName()));

        return $this->redirectToRoute('cart_index');
    }

    #[Route('/cart/remove/{id}', name: 'cart_remove', methods: ['POST'])]
    public function remove(Product $product, Request $request): Response
    {
        if (!$this->isCsrfTokenValid('cart_remove_' . $product->getId(), $request->request->get('_token'))) {
            throw $this->createAccessDeniedException('Jeton CSRF invalide.');
        }

        $session = $request->getSession();
        $cart = $session->get('cart', []);
        unset($cart[(string) $product->getId()]);
        $session->set('cart', $cart);

        $this->addFlash('success', sprintf('%s a été retiré du panier.', $product->getName()));

        return $this->redirectToRoute('cart_index');
    }

    #[Route('/cart/clear', name: 'cart_clear', methods: ['POST'])]
    public function clear(Request $request): Response
    {
        if (!$this->isCsrfTokenValid('cart_clear', $request->request->get('_token'))) {
            throw $this->createAccessDeniedException('Jeton CSRF invalide.');
        }

        $request->getSession()->remove('cart');

        $this->addFlash('success', 'Le panier a été vidé.');

        return $this->redirectToRoute('cart_index');
    }
}