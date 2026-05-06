<?php

namespace App\DataFixtures;

use App\Entity\Product;
use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();

        // create some categories
        $categories = [];
        $categoryNames = ['Smartphones', 'Ordinateurs', 'Audio', 'Maison connectée', 'Gaming'];
        foreach ($categoryNames as $name) {
            $c = new Category();
            $c->setName($name);
            $manager->persist($c);
            $categories[] = $c;
        }

        for ($i = 1; $i <= 50; $i++) {
            $product = new Product();
            $product->setName($faker->words(3, true));
            $product->setDescription($faker->paragraph());
            $product->setPrice($faker->randomFloat(2, 5, 500));
            $product->setImage(sprintf('https://picsum.photos/seed/%s/640/480', $faker->uuid()));
            // assign random category
            $product->setCategory($categories[array_rand($categories)]);

            $manager->persist($product);
        }

        $manager->flush();
    }
}
