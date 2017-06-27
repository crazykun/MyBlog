<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateAuthRule extends Migrator
{
    protected  $tableName='auth_rule';

	public function up()
	{
        if($this->hasTable($this->tableName)){
            $this->dropTable($this->tableName);
        }
        $table  = $this->table($this->tableName, array('engine'=>'MyISAM','comment'=>'规则表'));
        $table ->addColumn('name', 'string', array('limit' => 80))
            ->addColumn('title', 'string', array('limit' => 20))
            ->addColumn('type', 'integer', array('limit' => 1,'default'=>'1'))
            ->addColumn('status', 'integer', array('limit' => 1,'comment'=>'状态'))
            ->addColumn('pid', 'integer', array('limit' => 5,'comment'=>'父级ID'))
            ->addColumn('icon', 'string', array('limit' => 50,'comment'=>'图标'))
            ->addColumn('sort', 'integer', array('limit' => 50,'comment'=>'排序'))
            ->addColumn('condition', 'string', array('limit' => 100,'comment'=>'排序'))
            ->addIndex(array('name'), array('unique' => true,'name'=>'name'))
            ->save();

        $rows=[
            ['id'=>1,'name'=>'admin/System/default','title'=>'系统配置', 'status'=>'1','pid'=> '1','title'=> '0', 'icon'=>'fa fa-gears', 'sort'=>'5',]
        ];
        $this->insert($this->tableName, $rows);
	}
}
