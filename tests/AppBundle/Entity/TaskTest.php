<?php

namespace Tests\AppBundle\Entity;

use AppBundle\Entity\Task;
use PHPUnit\Framework\TestCase;

class TaskTest extends TestCase
{
    public function testTitle()
    {
        $task = new Task();
        $task->setTitle('something');
        $this->assertEquals('something', $task->getTitle());
        $task->setTitle(null);
        $this->assertNull($task->getTitle());
        $task->setTitle(true);
        $this->assertTrue($task->getTitle());
    }

    public function testContent()
    {
        $task = new Task();
        $task->setContent('something');
        $this->assertEquals('something', $task->getContent());
        $task->setContent(null);
        $this->assertNull($task->getContent());
        $task->setContent(true);
        $this->assertTrue($task->getContent());
    }

    public function testIsDone()
    {
        $task = new Task();
        $this->assertFalse($task->isDone());
    }

    public function testToggle()
    {
        $task = new Task();
        $task->toggle(true);
        $this->assertTrue($task->isDone());
        $task->toggle('string');
        $this->assertEquals('string', $task->isDone());
    }

    public function testCreatedAt()
    {
        $task = new Task();
        $datetime = new \DateTime();
        $task->setCreatedAt($datetime);
        $this->assertEquals($datetime, $task->getCreatedAt());
        $task->setCreatedAt(null);
        $this->assertNull($task->getCreatedAt());
    }
}