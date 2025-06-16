Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE91EF36E
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037602; cv=none; b=lRmo+zD4Ks4mBktRHE8wl194emnXMQn5ZSi/+5BaJM+OewwkY4G1LnuvUJdoFMMOk6V3HZmlgwS4IOejIrDQg1vjSTyyXVRvtXBZzqG9L/dfeW3ahp3KMntBOa+gdOKZVIaxmXiuLI/tJ22n/46FNrcWDNuXkFTELK0sC2BBCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037602; c=relaxed/simple;
	bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFuB9uIYQXL3QmcnsdT8SuVEtMw8EQDrLz1qEmgT/ib1kmhyMWSnAZmJU8diKWQ5dZS5kokivFe98ZNZXEKP2qMtHA3sJaA3SUB8ikM+RQiby9qZe/H+Ed7uvObQ2bjQ2Jfjs6Z1JzJcUN7Fi7kl+lYla1AtKeP+mouEXrtO/74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LojbZ1OQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LojbZ1OQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-236192f8770so26410825ad.0
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037600; x=1750642400; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=LojbZ1OQqVkpF8AL9wJ7r2iuN4p+zX5MNvqq9r6aqGHK6q5MLvHSFW6WjTw1OGuSfK
         iRhYx2TLMoJw+lIqlGz0/OLCCrW9+5HwlQdRUK/y3pOzLh3XNdb31NvCOcg3zFHzef7s
         Aj1u+y+5mBSP/uKicdfSttEeGXuP2jwZZTeAceVCqdaf3tlNMAH1j4kZz1LIpa+YyiKp
         TfJ1lszKqqocGO8ZhAXaRO9P4aBmEb2IainW9HolPGOzCI8XoMidK0P56563n9PuR4P8
         vFqmFWJyave05W+NZuKMI6UW2XjV522XAitaU3VEZEYJMvEhqg+3qsPpuE63LXE/hT8u
         lNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037600; x=1750642400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=FbkBAC1DbJoignoAmjBAV4RiGa7Etv8X3ubZcLb+4HuDFnoKdLdcoQrWulvdkv5rix
         ViyVlFANnM4f2xQEJa5Gsw5uxjFR522GXcibfRi+Ja3s+kBnmqyYG2tOojrbv8+X3SB7
         29kfveS2uF2jARiktEFRuKdDmVaglHA8+lI4Pyqy+niaRqzEy3la6HrGmYNPPgsyMBib
         bxbyzh5bfP3wfaOFLXm1+QBigXDZ+wvAKyzAwvgJMfU6v92y0oJ8DlQ0lI5LluKUhAgM
         BCd7zmKuRd/ESkDi3ecrpBzgiMVr8nuTvpdQsPiJT5/f5JkJjihtZhFdMcvbufzIhwnP
         KFRg==
X-Forwarded-Encrypted: i=1; AJvYcCUIHz+clGxJVUcw78/5xhC6HS8WKGEWwPr59/YWMo37/Iz6K9HGIHXS+Md/HN24JC/JbCs4AA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjQ1ug7WyNGq/683K/eNT0bPHbhAVD3Ice8U3j8KfV49pf9uXS
	+NFFHeOwcoyO88A3eLt0/jXg2uAVXoeHRwTHPSMKOae+X7InG2ftAvAH
X-Gm-Gg: ASbGnctf95G6FivjvZZScnhETb2GTi5XZL3Q0vgudhrAPyLxO9UsGkLAT+Q8Ppt44y7
	SmAaMQlLEEfBD55HRNtTTzWUdT/vh+u9mAVp6cB5JdY2fhpZxHjfGJJORvuB3Ifa9TrT2Vo0FuU
	lCyTMztzhNds0fmm6wqfjCH+xGNAk0Bt2wKWbpoqQbSOUaGbYnWoftiq9rZ1z9If7frDaz8EeNy
	HWXhMcU2o0r86rqmBCCM1sw+KPmWkRtepkQ/CqQdDhBE30rqmtRTht63CBMD9m80Dbuz1z4Nhuv
	DdlMemkxrp7R7fD6Jq4c97ARkhw5fbPILUe7jqHVMj7BJ56UHPwsYPqJJJF5xSUo4z88M5YxPHa
	yNsE=
X-Google-Smtp-Source: AGHT+IHwac9QTGWxlkC1rzZ2SMHVmAjfvFm/k/YvsDasORNoNjPp9i3crC4psW6aNolqCYQjKg8vrQ==
X-Received: by 2002:a17:903:98d:b0:233:d3e7:6fd6 with SMTP id d9443c01a7336-236678a6edcmr139967795ad.19.1750037600015;
        Sun, 15 Jun 2025 18:33:20 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:19 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:09 +0800
Subject: [PATCH RESEND v7 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-20-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3Qa6p1xENFWuaERQyHsdefacxc1lUVxttion
 +igFpn0Z02JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GgAKCRABygi3psUI
 JEUnD/9OsHCyPEKi9IsB1sRFkIFSwMCnJxmhxXbWNlRkpOPFr2HE/5NldQtqGVk5ePzKhwmAMD0
 RiL9IyxqhyYXU0zWo5aAHBilDRVIBOHWOETE9PyFhBtpJd67OMSzCfRHe1i9yUm7ijtX+gEaWsB
 QWl+G4//yilBZESoVxJJg29wAGDw89dgEVh2di6N6vaQ4rQFEjBlTv+M0fvnkcYipZteLo75Ot5
 xD0qG1fGN2q0JKcsZrfLB9TLxQbZAtUL8T3N190LSiYYSrUBe2LqHdG8MlF6C2eoAQC5RGNARj/
 R7EuIEqyA29pQoBsk5VWBnmQfnv0gOYEP2orq6SGF5obhrgSLQhgwMfmWNPjp/RS7jUiS9gmgzN
 SwWuCuMo6iB0k3KnIZs7gShT7u5jwlazrtSzknn8VHRrQZJitk2hnL7K1uwN54b5u+lrSM4P3Hx
 dOqwYVM/fmFRmldcL2Udf3MVMvFFWTjEe39GJcY/STrS9p2GND0JpNIg0G0W8RmTSTZbPZXWUmL
 /8l7ctLDuXyy/idnrADdgJD29QE01H6Sf/ZnkbgOWtOprWiuSj/3fbzTedrLMz6b6/eHsjGY6lA
 LNokQE2Jzrs95Bz84eiZQIbBk7KO2o9HDecKYjKmJ4oqcVIRYU59pIl50hZLG9AykMmeU0eMzTi
 CSizSVKXhOCwUig==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0

