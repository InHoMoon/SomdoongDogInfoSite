package somdoong.admin.service.impl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;
 
import somdoong.admin.dao.face.AdminDao;
import somdoong.admin.dto.Admin;
import somdoong.admin.service.face.AdminService;
import somdoong.member.dto.SomDoongMember;
 
@Service    //서비스 빈으로 설정함
public class AdminServiceImpl implements AdminService {
 
    
    @Inject    //dao를 호출하기때문에 의존성을 주입한다.
    Admin admindao;
    
    @Override    //로그인 체크 관련 메소드 (세션에 아이디와 비밀번호를 저장함)
    public boolean loginCheck(Admin dto, HttpSession session) throws Exception {
        
        boolean result = admindao.loginCheck(dto);
        
        if(result) {    //로그인 성공
            
            session.setAttribute("admin_id", dto.getAdminid());
            session.setAttribute("admin_pass", dto.getAdminpw());
            
        }
        
        return result;
    }
 
 
    //회원 강제탈퇴 관련 메소드
    @Override
    public void admin_member_forced_evictionCheck(SomDoongMember dto) throws Exception{
 
        admindao.admin_member_forced_evictionCheck(dto);
        
    }
 
}