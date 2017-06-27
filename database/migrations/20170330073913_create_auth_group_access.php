<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateAuthGroupAccess extends Migrator
{
    protected  $tableName='auth_group_access';

	public function up()
	{
        if($this->hasTable($this->tableName)){
            $this->dropTable($this->tableName);
        }
        $table  = $this->table($this->tableName, array('id' => false, 'primary_key' =>array('uid','group_id'),'engine'=>'MyISAM','comment'=>'权限组规则表'));
        $table ->addColumn('uid', 'integer', array('limit' => 8))
            ->addColumn('group_id', 'integer', array('limit' => 8))
            ->addIndex(array('uid', 'group_id'), array('unique' => true,'name'=>'uid_group_id'))
            ->save();

        $rows=[
            ['uid'=>1,'group_id'=>'1'],
            ['uid'=>2,'group_id'=>'2'],
        ];
        $this->insert($this->tableName, $rows);
	}
}
