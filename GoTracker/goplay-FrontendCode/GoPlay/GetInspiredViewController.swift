//
//  GetInspiredViewController.swift
//  GoPlay
//
//  Created by WorksDelight on 04/07/16.
//  Copyright © 2016 WorksDelight. All rights reserved.
//

import UIKit

class GetInspiredViewController: ExtensionViewController {
    
    
    @IBOutlet weak var quoteLable: UILabel!
    var quotesArray:NSMutableArray = NSMutableArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setBgImage()
        
        
        self.quotesArray.addObject("Life is about making an impact, not making an income. –Kevin Kruse")
        self.quotesArray.addObject("Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill")
        self.quotesArray.addObject("Strive not to be a success, but rather to be of value. –Albert Einstein")
        self.quotesArray.addObject("Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference. –Robert Frost")
        self.quotesArray.addObject("I attribute my success to this: I never gave or took any excuse. –Florence Nightingale")
        self.quotesArray.addObject("You miss 100% of the shots you don’t take. –Wayne Gretzky")
        self.quotesArray.addObject("I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed. –Michael Jordan")
        self.quotesArray.addObject("The most difficult thing is the decision to act, the rest is merely tenacity. –Amelia Earhart")
        self.quotesArray.addObject("Every strike brings me closer to the next home run. –Babe Ruth")
        self.quotesArray.addObject("Definiteness of purpose is the starting point of all achievement. –W. Clement Stone")
        self.quotesArray.addObject("Life isn’t about getting and having, it’s about giving and being. –Kevin Kruse")
        self.quotesArray.addObject("Life is what happens to you while you’re busy making other plans. –John Lennon")
        self.quotesArray.addObject("We become what we think about. –Earl Nightingale")
        self.quotesArray.addObject("Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails. Explore, Dream, Discover. –Mark Twain")
        self.quotesArray.addObject("Life is 10% what happens to me and 90% of how I react to it. –Charles Swindoll")
        self.quotesArray.addObject("The most common way people give up their power is by thinking they don’t have any. –Alice Walker")
        self.quotesArray.addObject("The mind is everything. What you think you become. –Buddha")
        self.quotesArray.addObject("The best time to plant a tree was 20 years ago. The second best time is now. –Chinese Proverb")
        self.quotesArray.addObject("An unexamined life is not worth living. –Socrates")
        self.quotesArray.addObject("Eighty percent of success is showing up. –Woody Allen")
        self.quotesArray.addObject("Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs")
        self.quotesArray.addObject("Winning isn’t everything, but wanting to win is. –Vince Lombardi")
        self.quotesArray.addObject("I am not a product of my circumstances. I am a product of my decisions. –Stephen Covey")
        self.quotesArray.addObject("Every child is an artist. The problem is how to remain an artist once he grows up. –Pablo Picasso")
        self.quotesArray.addObject("You can never cross the ocean until you have the courage to lose sight of the shore. –Christopher Columbus")
        self.quotesArray.addObject("I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. –Maya Angelou")
        self.quotesArray.addObject("Either you run the day, or the day runs you. –Jim Rohn")
        self.quotesArray.addObject("Whether you think you can or you think you can’t, you’re right. –Henry Ford")
        self.quotesArray.addObject("The two most important days in your life are the day you are born and the day you find out why. –Mark Twain")
        self.quotesArray.addObject("Whatever you can do, or dream you can, begin it. Boldness has genius, power and magic in it. –Johann Wolfgang von Goethe")
        self.quotesArray.addObject("The best revenge is massive success. –Frank Sinatra")
        self.quotesArray.addObject("People often say that motivation doesn’t last. Well, neither does bathing. That’s why we recommend it daily. –Zig Ziglar")
        self.quotesArray.addObject("Life shrinks or expands in proportion to one’s courage. –Anais Nin")
        self.quotesArray.addObject("If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced. –Vincent Van Gogh")
        self.quotesArray.addObject("There is only one way to avoid criticism: do nothing, say nothing, and be nothing. –Aristotle")
        self.quotesArray.addObject("The only person you are destined to become is the person you decide to be. –Ralph Waldo Emerson")
        self.quotesArray.addObject("Go confidently in the direction of your dreams. Live the life you have imagined. –Henry David Thoreau")
        self.quotesArray.addObject("When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me. –Erma Bombeck")
        self.quotesArray.addObject("Few things can help an individual more than to place responsibility on him, and to let him know that you trust him. –Booker T. Washington")
        self.quotesArray.addObject("Certain things catch your eye, but pursue only those that capture the heart. – Ancient Indian Proverb")
        self.quotesArray.addObject("Believe you can and you’re halfway there. –Theodore Roosevelt")
        self.quotesArray.addObject("Everything you’ve ever wanted is on the other side of fear. –George Addair")
        self.quotesArray.addObject("Start where you are. Use what you have. Do what you can. –Arthur Ashe")
        self.quotesArray.addObject("When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up. I wrote down ‘happy’. They told me I didn’t understand the assignment, and I told them they didn’t understand life. –John Lennon")
        self.quotesArray.addObject("Fall seven times and stand up eight. –Japanese Proverb")
        self.quotesArray.addObject("When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. –Helen Keller")
        self.quotesArray.addObject("Everything has beauty, but not everyone can see. –Confucius")
        self.quotesArray.addObject("How wonderful it is that nobody need wait a single moment before starting to improve the world. –Anne Frank")
        self.quotesArray.addObject("When I let go of what I am, I become what I might be. –Lao Tzu")
        self.quotesArray.addObject("Life is not measured by the number of breaths we take, but by the moments that take our breath away. –Maya Angelou")
        self.quotesArray.addObject("Happiness is not something readymade. It comes from your own actions. –Dalai Lama")
        self.quotesArray.addObject("If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on. –Sheryl Sandberg")
        self.quotesArray.addObject("First, have a definite, clear practical ideal; a goal, an objective. Second, have the necessary means to achieve your ends; wisdom, money, materials, and methods. Third, adjust all your means to that end. –Aristotle")
        self.quotesArray.addObject("You can’t fall if you don’t climb. But there’s no joy in living your whole life on the ground. –Unknown")
        self.quotesArray.addObject("We must believe that we are gifted for something, and that this thing, at whatever cost, must be attained. –Marie Curie")
        self.quotesArray.addObject("Too many of us are not living our dreams because we are living our fears. –Les Brown")
        self.quotesArray.addObject("Challenges are what make life interesting and overcoming them is what makes life meaningful. –Joshua J. Marine")
        self.quotesArray.addObject("If you want to lift yourself up, lift up someone else. –Booker T. Washington")
        self.quotesArray.addObject("I have been impressed with the urgency of doing. Knowing is not enough; we must apply. Being willing is not enough; we must do. –Leonardo da Vinci")
        self.quotesArray.addObject("Limitations live only in our minds. But if we use our imaginations, our possibilities become limitless. –Jamie Paolinetti")
        self.quotesArray.addObject("You take your life in your own hands, and what happens? A terrible thing, no one to blame. –Erica Jong")
        self.quotesArray.addObject("What’s money? A man is a success if he gets up in the morning and goes to bed at night and in between does what he wants to do. –Bob Dylan")
        self.quotesArray.addObject("I didn’t fail the test. I just found 100 ways to do it wrong. –Benjamin Franklin")
        self.quotesArray.addObject("A person who never made a mistake never tried anything new. – Albert Einstein")
        self.quotesArray.addObject("The person who says it cannot be done should not interrupt the person who is doing it. –Chinese Proverb")
        self.quotesArray.addObject("There are no traffic jams along the extra mile. –Roger Staubach")
        self.quotesArray.addObject("It is never too late to be what you might have been. –George Eliot")
        self.quotesArray.addObject("You become what you believe. –Oprah Winfrey")
        self.quotesArray.addObject("I would rather die of passion than of boredom. –Vincent van Gogh")
        self.quotesArray.addObject("A truly rich man is one whose children run into his arms when his hands are empty. –Unknown")
        self.quotesArray.addObject("It is not what you do for your children, but what you have taught them to do for themselves, that will make them successful human beings. –Ann Landers")
        self.quotesArray.addObject("If you want your children to turn out well, spend twice as much time with them, and half as much money. –Abigail Van Buren")
        self.quotesArray.addObject("Build your own dreams, or someone else will hire you to build theirs. –Farrah Gray")
        self.quotesArray.addObject("The battles that count aren’t the ones for gold medals. The struggles within yourself–the invisible battles inside all of us–that’s where it’s at. –Jesse Owens")
        self.quotesArray.addObject("Education costs money. But then so does ignorance. –Sir Claus Moser")
        self.quotesArray.addObject("I have learned over the years that when one’s mind is made up, this diminishes fear. –Rosa Parks")
        self.quotesArray.addObject("It does not matter how slowly you go as long as you do not stop. –Confucius")
        self.quotesArray.addObject("If you look at what you have in life, you’ll always have more. If you look at what you don’t have in life, you’ll never have enough. –Oprah Winfrey")
        self.quotesArray.addObject("Remember that not getting what you want is sometimes a wonderful stroke of luck. –Dalai Lama")
        self.quotesArray.addObject("You can’t use up creativity. The more you use, the more you have. –Maya Angelou")
        self.quotesArray.addObject("Dream big and dare to fail. –Norman Vaughan")
        self.quotesArray.addObject("Our lives begin to end the day we become silent about things that matter. –Martin Luther King Jr.")
        self.quotesArray.addObject("Do what you can, where you are, with what you have. –Teddy Roosevelt")
        self.quotesArray.addObject("If you do what you’ve always done, you’ll get what you’ve always gotten. –Tony Robbins")
        self.quotesArray.addObject("Dreaming, after all, is a form of planning. –Gloria Steinem")
        self.quotesArray.addObject("It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live. –Mae Jemison")
        self.quotesArray.addObject("You may be disappointed if you fail, but you are doomed if you don’t try. –Beverly Sills")
        self.quotesArray.addObject("Remember no one can make you feel inferior without your consent. –Eleanor Roosevelt")
        self.quotesArray.addObject("Life is what we make it, always has been, always will be. –Grandma Moses")
        self.quotesArray.addObject("The question isn’t who is going to let me; it’s who is going to stop me. –Ayn Rand")
        self.quotesArray.addObject("When everything seems to be going against you, remember that the airplane takes off against the wind, not with it. –Henry Ford")
        self.quotesArray.addObject("It’s not the years in your life that count. It’s the life in your years. –Abraham Lincoln")
        self.quotesArray.addObject("Change your thoughts and you change your world. –Norman Vincent Peale")
        self.quotesArray.addObject("Either write something worth reading or do something worth writing. –Benjamin Franklin")
        self.quotesArray.addObject("Nothing is impossible, the word itself says, “I’m possible!” –Audrey Hepburn")
        self.quotesArray.addObject("Life is about making an impact, not making an income. –Kevin Kruse")
        self.quotesArray.addObject("Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill")
        self.quotesArray.addObject("Strive not to be a success, but rather to be of value. –Albert Einstein")
        self.quotesArray.addObject("Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference. –Robert Frost")
        self.quotesArray.addObject("I attribute my success to this: I never gave or took any excuse. –Florence Nightingale")
        self.quotesArray.addObject("You miss 100% of the shots you don’t take. –Wayne Gretzky")
        self.quotesArray.addObject("I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed. –Michael Jordan")
        self.quotesArray.addObject("The most difficult thing is the decision to act, the rest is merely tenacity. –Amelia Earhart")
        self.quotesArray.addObject("Every strike brings me closer to the next home run. –Babe Ruth")
        self.quotesArray.addObject("Definiteness of purpose is the starting point of all achievement. –W. Clement Stone")
        self.quotesArray.addObject("Life isn’t about getting and having, it’s about giving and being. –Kevin Kruse")
        self.quotesArray.addObject("Life is what happens to you while you’re busy making other plans. –John Lennon")
        self.quotesArray.addObject("We become what we think about. –Earl Nightingale")
        self.quotesArray.addObject("Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails. Explore, Dream, Discover. –Mark Twain")
        self.quotesArray.addObject("Life is 10% what happens to me and 90% of how I react to it. –Charles Swindoll")
        self.quotesArray.addObject("The most common way people give up their power is by thinking they don’t have any. –Alice Walker")
        self.quotesArray.addObject("The mind is everything. What you think you become. –Buddha")
        self.quotesArray.addObject("The best time to plant a tree was 20 years ago. The second best time is now. –Chinese Proverb")
        self.quotesArray.addObject("An unexamined life is not worth living. –Socrates")
        self.quotesArray.addObject("Eighty percent of success is showing up. –Woody Allen")
        self.quotesArray.addObject("Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs")
        self.quotesArray.addObject("Winning isn’t everything, but wanting to win is. –Vince Lombardi")
        self.quotesArray.addObject("I am not a product of my circumstances. I am a product of my decisions. –Stephen Covey")
        self.quotesArray.addObject("Every child is an artist. The problem is how to remain an artist once he grows up. –Pablo Picasso")
        self.quotesArray.addObject("You can never cross the ocean until you have the courage to lose sight of the shore. –Christopher Columbus")
        self.quotesArray.addObject("I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. –Maya Angelou")
        self.quotesArray.addObject("Either you run the day, or the day runs you. –Jim Rohn")
        self.quotesArray.addObject("Whether you think you can or you think you can’t, you’re right. –Henry Ford")
        self.quotesArray.addObject("The two most important days in your life are the day you are born and the day you find out why. –Mark Twain")
        self.quotesArray.addObject("Whatever you can do, or dream you can, begin it. Boldness has genius, power and magic in it. –Johann Wolfgang von Goethe")
        self.quotesArray.addObject("The best revenge is massive success. –Frank Sinatra")
        self.quotesArray.addObject("People often say that motivation doesn’t last. Well, neither does bathing. That’s why we recommend it daily. –Zig Ziglar")
        self.quotesArray.addObject("Life shrinks or expands in proportion to one’s courage. –Anais Nin")
        self.quotesArray.addObject("If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced. –Vincent Van Gogh")
        self.quotesArray.addObject("There is only one way to avoid criticism: do nothing, say nothing, and be nothing. –Aristotle")
        self.quotesArray.addObject("The only person you are destined to become is the person you decide to be. –Ralph Waldo Emerson")
        self.quotesArray.addObject("Go confidently in the direction of your dreams. Live the life you have imagined. –Henry David Thoreau")
        self.quotesArray.addObject("When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me. –Erma Bombeck")
        self.quotesArray.addObject("Few things can help an individual more than to place responsibility on him, and to let him know that you trust him. –Booker T. Washington")
        self.quotesArray.addObject("Certain things catch your eye, but pursue only those that capture the heart. – Ancient Indian Proverb")
        self.quotesArray.addObject("Believe you can and you’re halfway there. –Theodore Roosevelt")
        self.quotesArray.addObject("Everything you’ve ever wanted is on the other side of fear. –George Addair")
        self.quotesArray.addObject("Start where you are. Use what you have. Do what you can. –Arthur Ashe")
        self.quotesArray.addObject("When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up. I wrote down ‘happy’. They told me I didn’t understand the assignment, and I told them they didn’t understand life. –John Lennon")
        self.quotesArray.addObject("Fall seven times and stand up eight. –Japanese Proverb")
        self.quotesArray.addObject("When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. –Helen Keller")
        self.quotesArray.addObject("Everything has beauty, but not everyone can see. –Confucius")
        self.quotesArray.addObject("How wonderful it is that nobody need wait a single moment before starting to improve the world. –Anne Frank")
        self.quotesArray.addObject("When I let go of what I am, I become what I might be. –Lao Tzu")
        self.quotesArray.addObject("Life is not measured by the number of breaths we take, but by the moments that take our breath away. –Maya Angelou")
        self.quotesArray.addObject("Happiness is not something readymade. It comes from your own actions. –Dalai Lama")
        self.quotesArray.addObject("If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on. –Sheryl Sandberg")
        self.quotesArray.addObject("First, have a definite, clear practical ideal; a goal, an objective. Second, have the necessary means to achieve your ends; wisdom, money, materials, and methods. Third, adjust all your means to that end. –Aristotle")
        self.quotesArray.addObject("You can’t fall if you don’t climb. But there’s no joy in living your whole life on the ground. –Unknown")
        self.quotesArray.addObject("We must believe that we are gifted for something, and that this thing, at whatever cost, must be attained. –Marie Curie")
        self.quotesArray.addObject("Too many of us are not living our dreams because we are living our fears. –Les Brown")
        self.quotesArray.addObject("Challenges are what make life interesting and overcoming them is what makes life meaningful. –Joshua J. Marine")
        self.quotesArray.addObject("If you want to lift yourself up, lift up someone else. –Booker T. Washington")
        self.quotesArray.addObject("I have been impressed with the urgency of doing. Knowing is not enough; we must apply. Being willing is not enough; we must do. –Leonardo da Vinci")
        self.quotesArray.addObject("Limitations live only in our minds. But if we use our imaginations, our possibilities become limitless. –Jamie Paolinetti")
        self.quotesArray.addObject("You take your life in your own hands, and what happens? A terrible thing, no one to blame. –Erica Jong")
        self.quotesArray.addObject("What’s money? A man is a success if he gets up in the morning and goes to bed at night and in between does what he wants to do. –Bob Dylan")
        self.quotesArray.addObject("I didn’t fail the test. I just found 100 ways to do it wrong. –Benjamin Franklin")
        self.quotesArray.addObject("A person who never made a mistake never tried anything new. – Albert Einstein")
        self.quotesArray.addObject("The person who says it cannot be done should not interrupt the person who is doing it. –Chinese Proverb")
        self.quotesArray.addObject("There are no traffic jams along the extra mile. –Roger Staubach")
        self.quotesArray.addObject("It is never too late to be what you might have been. –George Eliot")
        self.quotesArray.addObject("You become what you believe. –Oprah Winfrey")
        self.quotesArray.addObject("I would rather die of passion than of boredom. –Vincent van Gogh")
        self.quotesArray.addObject("A truly rich man is one whose children run into his arms when his hands are empty. –Unknown")
        self.quotesArray.addObject("It is not what you do for your children, but what you have taught them to do for themselves, that will make them successful human beings. –Ann Landers")
        self.quotesArray.addObject("If you want your children to turn out well, spend twice as much time with them, and half as much money. –Abigail Van Buren")
        self.quotesArray.addObject("Build your own dreams, or someone else will hire you to build theirs. –Farrah Gray")
        self.quotesArray.addObject("The battles that count aren’t the ones for gold medals. The struggles within yourself–the invisible battles inside all of us–that’s where it’s at. –Jesse Owens")
        self.quotesArray.addObject("Education costs money. But then so does ignorance. –Sir Claus Moser")
        self.quotesArray.addObject("I have learned over the years that when one’s mind is made up, this diminishes fear. –Rosa Parks")
        self.quotesArray.addObject("It does not matter how slowly you go as long as you do not stop. –Confucius")
        self.quotesArray.addObject("If you look at what you have in life, you’ll always have more. If you look at what you don’t have in life, you’ll never have enough. –Oprah Winfrey")
        self.quotesArray.addObject("Remember that not getting what you want is sometimes a wonderful stroke of luck. –Dalai Lama")
        self.quotesArray.addObject("You can’t use up creativity. The more you use, the more you have. –Maya Angelou")
        self.quotesArray.addObject("Dream big and dare to fail. –Norman Vaughan")
        self.quotesArray.addObject("Our lives begin to end the day we become silent about things that matter. –Martin Luther King Jr.")
        self.quotesArray.addObject("Do what you can, where you are, with what you have. –Teddy Roosevelt")
        self.quotesArray.addObject("If you do what you’ve always done, you’ll get what you’ve always gotten. –Tony Robbins")
        self.quotesArray.addObject("Dreaming, after all, is a form of planning. –Gloria Steinem")
        self.quotesArray.addObject("It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live. –Mae Jemison")
        self.quotesArray.addObject("You may be disappointed if you fail, but you are doomed if you don’t try. –Beverly Sills")
        self.quotesArray.addObject("Remember no one can make you feel inferior without your consent. –Eleanor Roosevelt")
        self.quotesArray.addObject("Life is what we make it, always has been, always will be. –Grandma Moses")
        self.quotesArray.addObject("The question isn’t who is going to let me; it’s who is going to stop me. –Ayn Rand")
        self.quotesArray.addObject("When everything seems to be going against you, remember that the airplane takes off against the wind, not with it. –Henry Ford")
        self.quotesArray.addObject("It’s not the years in your life that count. It’s the life in your years. –Abraham Lincoln")
        self.quotesArray.addObject("Change your thoughts and you change your world. –Norman Vincent Peale")
        self.quotesArray.addObject("Either write something worth reading or do something worth writing. –Benjamin Franklin")
        self.quotesArray.addObject("Nothing is impossible, the word itself says, “I’m possible!” –Audrey Hepburn")
        
        
        
        //Generate rmadome quote
       let num = arc4random_uniform(100) + 1;
       self.quoteLable.text = self.quotesArray.objectAtIndex(Int(num)) as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func onSideMenuAction(sender: UIButton)
    {
        self.slideMenuController()?.openLeft()
    }
    
    
}
