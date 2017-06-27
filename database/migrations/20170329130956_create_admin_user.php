<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateAdminUser extends Migrator
{
    protected  $tableName='admin_user';

	public function up()
	{
        if($this->hasTable($this->tableName)){
            $this->dropTable($this->tableName);
        }
        $table  = $this->table($this->tableName, array('engine'=>'MyISAM','comment'=>'管理员表'));
        $table ->addColumn('username', 'string', array('limit' => 20,'comment'=>'管理员用户名'))
            ->addColumn('password', 'string', array('limit' => 50,'default'=>'','null'=>false,'comment'=>'管理员密码'))
            ->addColumn('status', 'integer', array('limit' => 1,'comment'=>'状态 1 启用 0 禁用','default'=>1))
            ->addColumn('create_time', 'datetime', array('comment'=>'创建时间','null'=>true))
            ->addColumn('last_login_time', 'datetime', array('comment'=>'最后登录时间','null'=>true))
            ->addColumn('delete_time', 'datetime', array('comment'=>'删除时间','null'=>true))
            ->addColumn('last_login_ip', 'string', array('limit' => 20,'null'=>true,'comment'=>'最后登录IP'))
            ->addIndex(array('username'), array('unique' => true))
            ->save();

        $rows=[
            ['id'=>1,'username'=>'admin','password'=>'b63ddacba6c3835cc1b250c5d9de6ac1','status'=>'1','create_time'=>date('Y-m-d H:i:s'),'last_login_time'=>'','delete_time'=>'','last_login_ip'=>'0.0.0.0'],
            ['id'=>2,'username'=>'edit','password'=>'524d79a15f08063deba5ad872c0f2a34','status'=>'1','create_time'=>date('Y-m-d H:i:s'),'last_login_time'=>'','delete_time'=>'','last_login_ip'=>'0.0.0.0'],
        ];
        $this->insert($this->tableName, $rows);
	}
}
