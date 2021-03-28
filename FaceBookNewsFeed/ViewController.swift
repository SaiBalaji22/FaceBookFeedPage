//
//  ViewController.swift
//  FaceBookNewsFeed
//
//  Created by Sai Balaji on 27/03/21.
//

import UIKit

struct Post
{
    var UserName: String = ""
    var PostBody: String = ""
    var StatusLine: String = ""
    var ProfilePic: String = ""
    var PostImage: String = ""
    var PostStats: String = ""
    
}

var posts = [Post]()

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    
    let FeedCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cv.register(Feed.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        posts.append(Post(UserName: "Betty", PostBody: "Happy Birthday 🎂 Angela", StatusLine: "September 12 . Cupertino .", ProfilePic: "katie", PostImage: "angela",PostStats: "500 Likes 50 Comments"))
        posts.append(Post(UserName: "Candice", PostBody: "Beautiful M.T Fuji", StatusLine: "December 23 . Tokyo .", ProfilePic: "candice", PostImage: "fuji",PostStats: "200 Like 100 Comments"))
        
        posts.append(Post(UserName: "John", PostBody: "Happy birthday 🥳 Ben", StatusLine: "September 21 . Florida .", ProfilePic: "john", PostImage: "ben",PostStats: "40 Likes 80 Comments"))
        posts.append(Post(UserName: "Angela", PostBody: "Hello Kyoto", StatusLine: "December 22 . Kyoto .", ProfilePic: "angela", PostImage: "kyoto",PostStats: "90 Likes 2 comments"))
        posts.append(Post(UserName: "Katie", PostBody: "Happy Birthday Julia", StatusLine: "September 22 . Cupertino .", ProfilePic: "katie", PostImage: "girl",PostStats: "15 Likes 10 Comments"))
        posts.append(Post(UserName: "Yukiko", PostBody: "Beautiful China", StatusLine: "December 25 . Shangai .", ProfilePic: "emily", PostImage: "china",PostStats: "2000 Likes 500 Comments"))
        posts.append(Post(UserName: "Julia", PostBody: "Beautiful Tokyo", StatusLine: "December 10 . Tokyo .", ProfilePic: "girl", PostImage: "tokyo",PostStats: "3000 Likes 1000 Comments"))
        
        
        
       
        
        FeedCollectionView.delegate = self
        FeedCollectionView.dataSource = self
        
        view.addSubview(FeedCollectionView)
        setupAutoLayout()
        
    }
    
    func setupAutoLayout()
    {
        FeedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        FeedCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        FeedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        FeedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        FeedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Feed
       {
        
        cell.post = posts[indexPath.item]
        
        
        return cell
       }
        
        return UICollectionViewCell()
        
            
        
        
       
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 620)
    }
    

}


class Feed: UICollectionViewCell
{
   
    
    
    let ProfileNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
       
        

        
        
        return label
    }()
    
    
    
    let ProfileImage: UIImageView = {
       let imageview = UIImageView()
       // imageview.image = UIImage(named: "sampleprofile")
        imageview.layer.cornerRadius = 10
        return imageview
    
        
    }()
    
    let PostBody: UILabel = {
       
        let label = UILabel()
        //label.text = "Setting up my FB Feed..."
        label.font = UIFont.monospacedSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        
   
        return label
        
        
    }()
    
    let PostImage: UIImageView = {
       let pimage = UIImageView()
        //pimage.image = UIImage(named: "fuji")
        
        return pimage
        
        
    }()
    
    
    let Line: UIView = {
        let lineview = UIView()
        lineview.backgroundColor = UIColor.gray
        return lineview
        
    }()
    
    let LikeButton: UIButton = {
       let button = UIButton()
        
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.setImage(UIImage(named: "likeicon"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        
        return button
        
    }()
    
    let ShareButton: UIButton = {
       let button = UIButton()
        button.tintColor = UIColor.gray
        button.setImage(UIImage(named: "shareicon"), for: .normal)
        
        return button
        
    }()
    
    let CommentButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "commenticon"), for: .normal)
        return button
        
    }()
    
    
    let PostStatistics: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.gray
       
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    var post: Post?
    {
        didSet
        {
            let name  = NSMutableAttributedString(string: "\(post!.UserName)", attributes: [.foregroundColor:UIColor.black])
            name.append(NSAttributedString(string: "\n\(post!.StatusLine)",attributes: [.font:UIFont.boldSystemFont(ofSize: 12),.foregroundColor:UIColor.gray]))
            let attachment = NSTextAttachment()
            attachment.bounds = CGRect(x: 0, y: -10, width: 25, height: 25)
            attachment.image = UIImage(named: "globe")
            
            name.append(NSAttributedString(attachment: attachment))
            
            
            ProfileNameLabel.attributedText = name
            
            ProfileImage.image = UIImage(named: post!.ProfilePic)
            PostImage.image = UIImage(named: post!.PostImage)
            PostBody.text = post!.PostBody
            PostStatistics.text = post!.PostStats
            
        }
    }
   
    
   
    
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        self.backgroundColor = UIColor.white
        
        self.addSubview(ProfileNameLabel)
        self.addSubview(ProfileImage)
        self.addSubview(PostBody)
        self.addSubview(PostImage)
        self.addSubview(LikeButton)
        self.addSubview(Line)
        self.addSubview(PostStatistics)
        self.addSubview(ShareButton)
        self.addSubview(CommentButton)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAutoLayout()
    {
        ProfileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        ProfileNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        ProfileNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 100).isActive = true
        
        
        ProfileImage.translatesAutoresizingMaskIntoConstraints = false
        ProfileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
        ProfileImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        ProfileImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ProfileImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        PostBody.translatesAutoresizingMaskIntoConstraints = false
        PostBody.topAnchor.constraint(equalTo: ProfileNameLabel.bottomAnchor,constant: 40).isActive = true
        PostBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        PostImage.translatesAutoresizingMaskIntoConstraints = false
        PostImage.topAnchor.constraint(equalTo: PostBody.bottomAnchor,constant: 20).isActive = true
        PostImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        PostImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        
        LikeButton.translatesAutoresizingMaskIntoConstraints = false
        LikeButton.topAnchor.constraint(equalTo: PostImage.bottomAnchor,constant: 30).isActive = true
        LikeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2).isActive = true
        LikeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        LikeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        Line.translatesAutoresizingMaskIntoConstraints = false
        Line.topAnchor.constraint(equalTo: PostImage.bottomAnchor, constant: 30).isActive = true
        Line.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        PostStatistics.translatesAutoresizingMaskIntoConstraints = false
        PostStatistics.topAnchor.constraint(equalTo: PostImage.bottomAnchor, constant: 5).isActive = true
        PostStatistics.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        ShareButton.translatesAutoresizingMaskIntoConstraints = false
        ShareButton.topAnchor.constraint(equalTo: PostImage.bottomAnchor, constant: 45).isActive = true
        ShareButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        ShareButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ShareButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        CommentButton.translatesAutoresizingMaskIntoConstraints = false
        CommentButton.topAnchor.constraint(equalTo: PostImage.bottomAnchor,constant: 55).isActive = true
        CommentButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        CommentButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 170).isActive = true
        CommentButton.topAnchor.constraint(equalTo: PostImage.bottomAnchor, constant: 45).isActive = true
        CommentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
   
    
    
    
   
}

