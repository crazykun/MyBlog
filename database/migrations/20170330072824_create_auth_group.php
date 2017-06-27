<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateAuthGroup extends Migrator
{

    protected  $tableName='auth_group';

	public function up()
	{
        if($this->hasTable($this->tableName)){
            $this->dropTable($this->tableName);
        }
        $table  = $this->table($this->tableName, array('engine'=>'MyISAM','comment'=>'权限组表'));
        $table->addColumn('title', 'string', array('limit' => 100,'default'=>''))
            ->addColumn('status', 'integer', array('limit' => 1,'default'=>'1'))
            ->addColumn('rules', 'string', array('limit' => 255,'comment'=>'权限规则ID'))
            ->save();

        $rows=[
            ['id'=>1,'title'=>'超级管理组','status'=>'1','rules'=>'1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72',],
            ['id'=>2,'title'=>'编辑','status'=>'1','rules'=>'14,13,20,21,22,23,24,15,25,26,27,28,29,30,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72',],
        ];
        $this->insert($this->tableName, $rows);
	}
}
