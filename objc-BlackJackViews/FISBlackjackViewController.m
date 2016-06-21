//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by John Hussain on 6/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"
#import "FISBlackjackGame.h"
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"
#import "FISCard.h"

@interface FISBlackjackViewController ()

@property (weak, nonatomic) IBOutlet UILabel *winner;
@property (weak, nonatomic) IBOutlet UILabel *house;
@property (weak, nonatomic) IBOutlet UILabel *houseStayed;
@property (weak, nonatomic) IBOutlet UILabel *houseScore;
@property (weak, nonatomic) IBOutlet UILabel *houseCard1;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5;
@property (weak, nonatomic) IBOutlet UILabel *houseWins;
@property (weak, nonatomic) IBOutlet UILabel *houseBust;
@property (weak, nonatomic) IBOutlet UILabel *houseLosses;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjack;

@property (weak, nonatomic) IBOutlet UILabel *player;
@property (weak, nonatomic) IBOutlet UILabel *playerStayed;
@property (weak, nonatomic) IBOutlet UILabel *playerScore;
@property (weak, nonatomic) IBOutlet UILabel *playerCard1;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5;
@property (weak, nonatomic) IBOutlet UILabel *playerWins;
@property (weak, nonatomic) IBOutlet UILabel *playerBust;
@property (weak, nonatomic) IBOutlet UILabel *playerLosses;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjack;

@property (weak, nonatomic) IBOutlet UIButton *hitButton;
@property (weak, nonatomic) IBOutlet UIButton *stayButton;

@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) resetCardLabel{
    
    [self.playerCard3 setHidden:YES];
    [self.playerCard4 setHidden:YES];
    [self.playerCard5 setHidden:YES];
    
    [self.houseCard3 setHidden:YES];
    [self.houseCard4 setHidden:YES];
    [self.houseCard5 setHidden:YES];
    
}

- (IBAction)deal:(id)sender {
    
    self.game = [[FISBlackjackGame alloc]init];
    
    [self resetCardLabel];
    
    [self.game.deck resetDeck];
    [self.game dealNewRound];
    
    [self.playerCard1 setHidden:NO];
    
    
    [self.houseCard1 setHidden:NO];
    
    
    [self.playerCard2 setHidden:NO];
    
    
    [self.houseCard2 setHidden:NO];
    
    [self.houseScore setHidden:NO];
    
    [self.winner setHidden: YES];
    
    [self.playerBlackjack setHidden:YES];
    [self.playerBust setHidden:YES];
    
    [self.houseBlackjack setHidden:YES];
    [self.houseBust setHidden:YES];
    
    
    FISCard *playerCardDealt1 = self.game.player.cardsInHand[0];
    FISCard *playerCardDealt2 = self.game.player.cardsInHand[1];
    
    self.playerCard1.text = playerCardDealt1.cardLabel;
    self.playerCard2.text = playerCardDealt2.cardLabel;
    
    FISCard *houseCardDealt1 = self.game.house.cardsInHand[0];
    FISCard *houseCardDealt2 = self.game.house.cardsInHand[1];
    
    self.houseCard1.text = houseCardDealt1.cardLabel;
    self.houseCard2.text = houseCardDealt2.cardLabel;
    
    if (self.game.house.blackjack == YES) {
        [self.houseBlackjack setHidden:NO];
        [self.winner setHidden:NO];
        self.winner.text = @"House Wins!!";
    }
    
    if (self.game.player.blackjack == YES) {
        [self.playerBlackjack setHidden:NO];
        [self.winner setHidden:NO];
        self.winner.text = @"Player Wins!!";
    }
    
    self.playerScore.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
    self.houseScore.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
    
    [self.hitButton setEnabled:YES];
    [self.stayButton setEnabled:YES];
    
}

- (IBAction)hit:(id)sender {
    
    NSLog(@"before hitting Number of cards in hand: %lu", self.game.player.cardsInHand.count);
    //NSLog(@"%@", self.game.player.cardsInHand);
    
    if (self.game.player.cardsInHand.count == 2) {
        [self.game dealCardToPlayer];
        [self.playerCard3 setHidden:NO];
        FISCard *playerCardDealt3 = self.game.player.cardsInHand[2];
        self.playerCard3.text = playerCardDealt3.cardLabel;
        self.playerScore.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
        
        if (self.game.player.busted == YES) {
            [self.playerBust setHidden:NO];
            [self.winner setHidden:NO];
            self.winner.text = @"House Wins!!";
        }
        
        NSLog(@"After hitting, Number of cards in hand: %lu", self.game.player.cardsInHand.count);
        
    }
    
    else if (self.game.player.cardsInHand.count == 3) {
        [self.game dealCardToPlayer];
        [self.playerCard4 setHidden:NO];
        FISCard *playerCardDealt4 = self.game.player.cardsInHand[3];
        self.playerCard4.text = playerCardDealt4.cardLabel;
        self.playerScore.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
        
        if (self.game.player.busted == YES) {
            [self.playerBust setHidden:NO];
            [self.winner setHidden:NO];
            self.winner.text = @"House Wins!!";
        }
        
        NSLog(@"After hitting, Number of cards in hand: %lu", self.game.player.cardsInHand.count);
    }
    
    else if (self.game.player.cardsInHand.count == 4) {
        [self.game dealCardToPlayer];
        [self.playerCard5 setHidden:NO];
        FISCard *playerCardDealt5 = self.game.player.cardsInHand[4];
        self.playerCard5.text = playerCardDealt5.cardLabel;
        self.playerScore.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
        
        if (self.game.player.busted == YES) {
            [self.playerBust setHidden:NO];
            [self.winner setHidden:NO];
            self.winner.text = @"House Wins!!";
        }
        
        NSLog(@"After hitting, Number of cards in hand: %lu", self.game.player.cardsInHand.count);
    }
    
    else NSLog(@"Can't be dealt anymore!");
    
}



- (IBAction)stay:(id)sender {
    
    [self.winner setHidden:NO];
    
    NSLog(@"before hitting Number of cards in hand: %lu", self.game.house.cardsInHand.count);
    [self.hitButton setEnabled: NO];
    [self.stayButton setEnabled: NO];
    
    if (self.game.house.cardsInHand.count == 2) {
        [self.game dealCardToHouse];
        [self.houseCard3 setHidden:NO];
        FISCard *houseCardDealt3 = self.game.house.cardsInHand[2];
        self.houseCard3.text = houseCardDealt3.cardLabel;
        self.houseScore.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
        
        if (self.game.house.busted == YES) {
            [self.houseBust setHidden:NO];
            [self.winner setHidden:NO];
            self.winner.text = @"Player Wins!!";
        }
        
        
        NSLog(@"After hitting, Number of cards in hand: %lu", self.game.house.cardsInHand.count);
        
    }
    
    else if (self.game.house.cardsInHand.count == 3) {
        [self.game dealCardToHouse];
        [self.houseCard4 setHidden:NO];
        FISCard *houseCardDealt4 = self.game.house.cardsInHand[3];
        self.houseCard4.text = houseCardDealt4.cardLabel;
        self.houseScore.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
        
        if (self.game.house.busted == YES) {
            [self.houseBust setHidden:NO];
            [self.winner setHidden:NO];
            self.winner.text = @"Player Wins!!";
        }
        
        NSLog(@"After hitting, Number of cards in hand: %lu", self.game.house.cardsInHand.count);
    }
    
    else if (self.game.house.cardsInHand.count == 4) {
        [self.game dealCardToHouse];
        [self.houseCard5 setHidden:NO];
        FISCard *houseCardDealt5 = self.game.house.cardsInHand[4];
        self.houseCard5.text = houseCardDealt5.cardLabel;
        self.houseScore.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
        
        if (self.game.house.busted == YES) {
            [self.houseBust setHidden:NO];
            [self.winner setHidden:NO];
            self.winner.text = @"Player Wins!!";
        }
        
        NSLog(@"After hitting, Number of cards in hand: %lu", self.game.house.cardsInHand.count);
    }
    
    else NSLog(@"Can't be dealt anymore!");
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
