package com.example.demo.entity;

import com.example.demo.type.AgeGroup;
import com.example.demo.type.GenderType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class SiteUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "PASSWORD", length = 1023, nullable = false, columnDefinition = "VARCHAR(1023)")
    private String password;

    @Column(name = "NICKNAME", length = 50, nullable = false, columnDefinition = "VARCHAR(50)")
    private String nickname;

    @Column(name = "EMAIL", length = 255, nullable = false, columnDefinition = "VARCHAR(255)")
    private String email;

    @Column(name = "PHONE_NUMBER", length = 50, nullable = false, columnDefinition = "VARCHAR(50)")
    private String phoneNumber;

    @Column(name = "MANNER_SCORE")
    private Integer mannerScore;

    @Column(name = "PENALTY_SCORE")
    private Integer penaltyScore;

    @Enumerated(EnumType.STRING)
    @Column(name = "GENDER", length = 50, nullable = false, columnDefinition = "VARCHAR(50)")
    private GenderType gender;

    @Column(name = "NTRP", precision = 2, scale = 1, nullable = false, columnDefinition = "DECIMAL(2,1)")
    private BigDecimal ntrp;

    @Column(name = "LOCATION_SI", length = 50, nullable = false, columnDefinition = "VARCHAR(50)")
    private String locationSi;

    @Column(name = "LOCATION_GU", length = 50, nullable = false, columnDefinition = "VARCHAR(50)")
    private String locationGu;

    @Enumerated(EnumType.STRING)
    @Column(name = "AGE_GROUP", length = 50, nullable = false, columnDefinition = "VARCHAR(50)")
    private AgeGroup ageGroup;

    @Column(name = "PROFILE_IMG", length = 1023, columnDefinition = "VARCHAR(1023)")
    private String profileImg;

    @Column(name = "CREATE_DATE", nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp createDate;

    @Column(name = "IS_PHONE_VERIFIED", columnDefinition = "TINYINT(1) DEFAULT 0")
    private Boolean isPhoneVerified;

    @OneToMany(mappedBy = "siteUser")
    private List<Matching> hostedMatches; // 주최한 매칭

    @OneToMany(mappedBy = "siteUser")
    private List<Apply> applies; // 신청 내역

    @OneToMany(mappedBy = "siteUser")
    private List<Notification> notifications; // 알림
}
