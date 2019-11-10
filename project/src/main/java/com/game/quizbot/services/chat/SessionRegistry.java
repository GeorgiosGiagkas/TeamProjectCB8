package com.game.quizbot.services.chat;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dao.UserDaoImpl;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.utils.BeanUtil;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

public class SessionRegistry {
    private static SessionRegistry sessionRegistry=null;
    private Collection<HttpSession> sessions=new CopyOnWriteArraySet<>();

    private UserDao userDao = BeanUtil.getBean(UserDaoImpl.class);
    private SessionRegistry(){};

    public static synchronized  SessionRegistry getSessionRegistry(){

        if(sessionRegistry==null){
            sessionRegistry= new SessionRegistry();
        }
        return  sessionRegistry;
    }

    public  synchronized  void add(HttpSession session){
        sessions.add(session);
    }

    public synchronized  void remove(String  sessionId){
        Iterator<HttpSession> itr = sessions.iterator();
        while(itr.hasNext()){
            HttpSession session =itr.next();
            if(session.getId().equals(sessionId)){
                sessions.remove(session);
            }
        }
    }

    public int countSessions(){
        return sessions.size();
    }


    public synchronized AvailableAdmin getAvailableAdmin(){
        Iterator<HttpSession> itr = sessions.iterator();
        AvailableAdmin availableAdmin = new AvailableAdmin();
        while(itr.hasNext()){
            HttpSession session =itr.next();
            UserDto userDto = ((UserDto)session.getAttribute("login-admin"));
            //return the first available
            if(userDto!=null){
                if(userDto.getRoleId()==1)  {
                    availableAdmin.setSessionId(session.getId());
                    availableAdmin.setAvatarId(userDto.getSelectedAvatarId());
                    return availableAdmin;
                }
            }
        }
        availableAdmin.setSessionId("not available");
        return availableAdmin;
    }


    public synchronized String getUserSessionId(int userId){

        Iterator<HttpSession> itr = sessions.iterator();
        while(itr.hasNext()){
            HttpSession session =itr.next();
            UserDto userDto = ((UserDto)session.getAttribute("login-user"));
            if(userDto!=null){
                if(userDto.getRoleId()==2 && userDto.getUserId()==userId) return session.getId();
            }
        }
        return "not available";
    }

    public  synchronized  int getUserIdByNickname(String userNickname){
        Iterator<HttpSession> itr = sessions.iterator();
        while(itr.hasNext()){
            HttpSession session =itr.next();
            UserDto userDto = ((UserDto)session.getAttribute("login-user"));
            if(userDto!=null){
                if(userDto.getRoleId()==2 && userDto.getUserNickname().equals(userNickname)) return userDto.getUserId();
            }
        }
        return 0;
    }

}
