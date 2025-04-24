<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\ProductRepository;
final class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(ProductRepository $productRepository): Response
    {
        $products = $productRepository->findBy([], ['id' => 'DESC'], 8); // derniers produits

        return $this->render('home/index.html.twig', [
            'products' => $products,
        ]);
    }
    
}
