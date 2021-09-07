//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;


contract DecentralinkInd {
    
    string public name = "DecentralinkInd";
    uint index;
    enum creerPost { paspret, pret }
    
            struct Profile {
            uint id;
            string name;
            string profession;
            string companyName;
            address internaute;
            creerPost etat;
            
           }
     
     
     struct Post {
     uint id;
     string comment;
     string imageHash;
     address user;
     uint seen;
     creerPost etat;
   }
       
   
    mapping (address => Profile) public monProfile;
    
    // store post 
    uint public postCount =0;
    mapping (address => Post) public POSTS;
    
function SetProfile(
    string memory _name,
    string memory _profession,
    string memory _companyName
    ) public {
   
   
   
   // make sure it is a human
   require (msg.sender != address(0x0), "you must connect with valid address");
 
 
   // increment set Profile
   index++;
   
   monProfile[msg.sender]= Profile ( index ,_name,  _profession, _companyName, msg.sender,  creerPost.paspret);
      
   }
    
     // create new Post
   function createPost (
        string memory _imageHash ,
        string memory _comment) public {
        
        // make sure it is a human with valid address
        require (msg.sender != address(0x0), "you must connect with valid address");
       
         
        // you should upload an image 
        require (bytes(_imageHash).length>0, "you cannot upload a blank image");
        
        // cannot upload a blanck comment 
        require (bytes(_comment).length>0, "you cannot upload a blanck comment");

        
    // increment post 
    postCount++;
    
    POSTS[msg.sender] = Post (postCount, _comment, _imageHash, msg.sender,0,  creerPost.pret);
        
    } 
    
    function voirPOst (uint _id) public {

    POSTS[msg.sender].id=_id;
    POSTS[msg.sender].seen;
    

    }
    
 }
    
    
    
