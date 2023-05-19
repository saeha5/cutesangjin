package com.hideon.myapp.main_share.Entity;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Builder
@Table(name = "posts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class MSEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer num;
    @Column(unique = true , nullable = true)
    private String user_id;
    @Column
    private String title;
    @Column
    private String content;
    @Column
    private Integer view_count;
    @Column
    private String created_at;
    @Column
    private String updated_at;
    @Column
    private Integer sort;
}
