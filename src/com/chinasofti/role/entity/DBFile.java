package com.chinasofti.role.entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description DBFile
 * @Author WYR
 * @CreateTime 2019-05-05 9:56
 */
@Entity
@Table(name = "db_recover")
public class DBFile {
    /**
     * 数据库备份文件编号
     */
    private Integer recoverId;
    /**
     * 文件名称
     */
    private String fileName;

    public DBFile() {
    }

    public DBFile(String fileName) {
        this.fileName = fileName;
    }

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "recover_id")
    public Integer getRecoverId() {
        return recoverId;
    }

    public void setRecoverId(Integer recoverId) {
        this.recoverId = recoverId;
    }

    @Column(name = "file_name")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
