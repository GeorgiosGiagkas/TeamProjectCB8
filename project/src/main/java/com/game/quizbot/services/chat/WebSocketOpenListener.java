package com.game.quizbot.services.chat;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;

@Component
public class WebSocketOpenListener implements ApplicationListener {
    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {
        if(applicationEvent instanceof SessionConnectedEvent){
            String httpSessionId = ((SessionConnectedEvent) applicationEvent).getUser().getName();
            System.out.println("connected session id:"+httpSessionId);

        }
    }
}
