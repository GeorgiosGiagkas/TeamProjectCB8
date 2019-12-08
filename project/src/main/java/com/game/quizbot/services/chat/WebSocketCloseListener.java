package com.game.quizbot.services.chat;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;


@Component
public class WebSocketCloseListener implements ApplicationListener {
    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {

        if(applicationEvent instanceof SessionDisconnectEvent) {
            String httpSessionId = ((SessionDisconnectEvent) applicationEvent).getUser().getName();
            SessionRegistry sessionRegistry = SessionRegistry.getSessionRegistry();
            sessionRegistry.remove(httpSessionId);


        }
    }
}
