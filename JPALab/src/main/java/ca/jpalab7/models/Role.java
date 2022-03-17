/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.jpalab7.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.*; 

/**
 *
 * @author Mark Del Rosario
 */


@Entity
@Table(name = "role")
@NamedQueries ({ 
@NamedQuery(name = "Role.findAll", query = "SELECT r FROM Role r")
})
public class Role implements Serializable  {
    
    @Id
    @Basic
    @Column(name = "role_id")
    private int id;
    @Column(name = "role_name")
    private String name;
    
    @OneToMany
    private List<User> user; 
     
    public Role(){
        
    }
    
    public Role(int id, String name){
        this.id = id;
        this.name = name; 
        
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    public String toString(){
        return name;
    }
    
    
}
