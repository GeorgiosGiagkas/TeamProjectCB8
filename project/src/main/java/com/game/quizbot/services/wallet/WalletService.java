package com.game.quizbot.services.wallet;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class WalletService {
    @Autowired
    UserDao userDao;

    public void updateWalletStatus(WalletPrize walletPrize){
        User user = userDao.getUserById(walletPrize.getUserId());
        if(user!=null){
            int currentWallet = user.getWallet();
            int newWallet = currentWallet + walletPrize.calculateWalletPrize();
            walletPrize.setWallet(newWallet);
            user.setWallet(newWallet);
            //update
            userDao.updateUser(user);


        }

    }
}
