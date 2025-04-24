<?php

use App\Entity\Category;
use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();

        for ($i = 1; $i <= 5; $i++) {
            $category = new Category();
            $category->setName($faker->word);
            $manager->persist($category);

            for ($j = 1; $j <= 10; $j++) {
                $product = new Product();
                $product->setName($faker->word);
                $product->setDescription($faker->paragraph);
                $product->setPrice($faker->randomFloat(2, 5, 500));
                
                $product->setImage($faker->image(640, 480, 'technics', true));
                
                $manager->persist($product);
            }
        }

        $manager->flush();
    }
}
