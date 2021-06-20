<?php

namespace Tests\AppBundle\Entity;

use AppBundle\Entity\User;
use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    public function testUsername()
    {
        $user = new User();
        $user->setUsername('something');
        $this->assertEquals('something', $user->getUsername());
    }

    public function testPassword()
    {
        $user = new User();
        $user->setPassword('something');
        $this->assertEquals('something', $user->getPassword());
    }

    public function testSalt()
    {
        $user = new User();
        $this->assertNull($user->getSalt());
    }

    public function testEmail()
    {
        $user = new User();
        $user->setEmail('something');
        $this->assertEquals('something', $user->getEmail());
    }

    public function testRoles()
    {
        $user = new User();
        $this->assertCount(1, $user->getRoles());
        $this->assertContains('ROLE_USER', $user->getRoles());
    }
}