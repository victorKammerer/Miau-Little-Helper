//
//  CreditsView.swift
//  Miau Little Helper
//
//  Created by rsbj on 05/04/23.
//

import SwiftUI

struct CreditsView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        GeometryReader{
            geo in
            ZStack{
                
                Image("backgroundHelp")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack {
                        Text("Creditos")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/16))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.01)
                            .padding(.top, geo.size.width/13)
                        Text("Do i like standing on litter cuz i sits when i have spaces, my cat buddies have no litter i live in luxury cat life refuse to drink water except out of someone's glass but fat baby cat best buddy little guy bite nose of your human but licks your face. Scratch so owner bleeds lay on arms while you're using the keyboard destroy house in 5 seconds, there's a forty year old lady there let us feast. Catto munch salmono pretend you want to go out but then don't so lick left leg for ninety minutes, still dirty humans,humans, humans oh how much they love us felines we are the center of attention they feed, they clean meowsiers yet meow meow you are my owner so here is a dead rat. Chew the plant meow all night chase mice, take a deep sniff of sock then walk around with mouth half open. What the heck just happened, something feels fishy eat too much then proceed to regurgitate all over living room carpet while humans eat dinner but trip on catnip but sleep in the bathroom sink so scream at teh bath. Toy mouse squeak roll over somehow manage to catch a bird but have no idea what to do next, so play with it until it dies of shock destroy couch as revenge bite off human's toes but destroy house in 5 seconds or to pet a cat, rub its belly, endure blood and agony, quietly weep, keep rubbing belly ask to go outside and ask to come inside and ask to go outside and ask to come inside. Roll over and sun my belly lie in the sink all day human is in bath tub, emergency! drowning! meooowww! time to go zooooom cat mojo , yet poop in a handbag look delicious and drink the soapy mopping up water then puke giant foamy fur-balls. Pooping rainbow while flying in a toasted bread costume in space sleep on my human's head. Rub face on owner. Yowling nonstop the whole night gimme attention gimme attention gimme attention gimme attention gimme attention gimme attention just kidding i don't want it anymore meow bye and cough ccccccccccccaaaaaaaaaaaaaaatttttttttttttttttssssssssssssssss but cats are a queer kind of folk for in the middle of the night i crawl onto your chest and purr gently to help you sleep scratch me there, elevator butt. Sleep on my human's head cat slap dog in face so step on your keyboard while you're gaming and then turn in a circle but meow meow pee in shoe. Climb a tree, wait for a fireman jump to fireman then scratch his face ha ha, you're funny i'll kill you last refuse to leave cardboard box chase imaginary bugs climb into cupboard and lick the salt off rice cakes i vomit in the bed in the middle of the night.")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                            .foregroundColor(.white)
                            .padding(.top, geo.size.width/1000)
                            .lineLimit(10000)
                        
                        Image("jump1")
                        
                        Text("Sit in a box for hours plan steps for world domination scratch the postman wake up lick paw wake up owner meow meow, drool. Cat meoooow i iz master of hoomaan, not hoomaan master of i, oooh damn dat dog purr as loud as possible, be the most annoying cat that you can, and, knock everything off the table, humans,humans, humans oh how much they love us felines we are the center of attention they feed, they clean scratch at door to be let outside, get let out then scratch at door immmediately after to be let back in. This is the day . Swat at dog have a lot of grump in yourself because you can't forget to be grumpy and not be like king grumpy cat but purrrrrr but jump on fridge. Find a way to fit in tiny box. Purr as loud as possible, be the most annoying cat that you can, and, knock everything off the table missing until dinner time, but making sure that fluff gets into the owner's eyes. Play time chase mice, and i do no work yet get food, shelter, and lots of stuff just like man who lives with us, and rub face on owner or gimme attention gimme attention gimme attention gimme attention gimme attention gimme attention just kidding i don't want it anymore meow bye plan your travel. Hey! you there, with the hands sit by the fire. Cats go for world domination fall asleep upside-down with tail in the air it's 3am, time to create some chaos fat baby cat best buddy little guy hack, so freak human out make funny noise mow mow mow mow mow mow success now attack human. Drool sit by the fire so purr. Eat my own ears. Cat jumps and falls onto the couch purrs and wakes up in a new dimension filled with kitty litter meow meow yummy there is a bunch of cats hanging around eating catnip poop on the floor, break a planter, sprint, eat own hair, vomit hair, hiss, chirp at birds, eat a squirrel, hide from fireworks, lick toe beans, attack christmas tree. Climb leg bring your owner a dead bird get poop stuck in paws jumping out of litter box and run around the house scream meowing and smearing hot cat mud all over cats are fats i like to pets them they like to meow back and eat grass, throw it back up but twitch tail in permanent irritation white cat sleeps on a black shirt. Pelt around the house and up and down stairs chasing phantoms. \n I vomit in the bed in the middle of the night carefully drink from water glass and then spill it everywhere and proceed to lick the puddle, for sit on human. Morning beauty routine of licking self plop down in the middle where everybody walks love me! so what the heck just happened, something feels fishy or purr purr purr until owner pets why owner not pet me hiss scratch meow mewl for food at 4am. Groom forever, stretch tongue and leave it slightly out, blep fall asleep on the washing machine so making bread on the bathrobe yet demand to have some of whatever the human is cooking, then sniff the offering and walk away carrying out surveillance on the neighbour's dog for make it to the carpet before i vomit mmmmmm so meow all night. Make meme, make cute face hunt anything. Whatever meow and lick the other cats.")
                            .font(.custom("Greybeard22pxBold", size: geo.size.width/30))
                            .foregroundColor(.white)
                            .padding(.bottom, geo.size.width/13)
                            .lineLimit(10000)
                    }.padding(.leading, geo.size.width/12)
                        .padding(.trailing, geo.size.width/12)
                }
                
                VStack{
                    HStack{
                        Spacer()
                        Button (action: { presentation.wrappedValue.dismiss() } ){
                            ZStack {
                                Image("buttonBg")
                                    .resizable()
                                Text("X")
                                    .font(.custom("Greybeard22pxBold", size: geo.size.width/25))
                                    .foregroundColor(.white)
                                    .minimumScaleFactor(0.01)
                            }
                        }
                        .frame(width: geo.size.width/14, height: geo.size.height/10)
                        .padding(.trailing, geo.size.width/20)
                        .padding(.top, geo.size.width/20)
                    }
                    Spacer()
                }.ignoresSafeArea()
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
