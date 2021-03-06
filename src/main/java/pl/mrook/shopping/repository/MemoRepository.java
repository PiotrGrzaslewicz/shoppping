package pl.mrook.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import pl.mrook.shopping.model.Memo;
import pl.mrook.shopping.model.User;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface MemoRepository extends JpaRepository<Memo, Long> {


    List<Memo> findAllByUser(User user);
    @Modifying
    @Transactional
    void deleteAllByUser(User user);

}
