Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500D29DB79
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563154; cv=none; b=SioYqv2JYO5crfEPn5b04Su35AnSyWi/2GfuDeTUHpO9G7qPo0EVrLLQIO7WIWQZNmhy1FwnJ+buDC80OgXOV+rwuGqvrctzgfsJt0rg4EBRiv9vUsN6U6goeST/eqgVuW/3JNDRUnxEmli1gkymNez5htpw2AhTBU4ptyx0Qwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563154; c=relaxed/simple;
	bh=LgWOfIRrAa1vCwGdhDD6foU+2vSIX2068gA8U5LxxFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MTvPCUvLnjWmF7DS9pYbC3jfZ1Fk1UBYk0ftPSi5K9fBFhPkDmWNUT2e+nGCMbf0rqSfz/y5DvkcqyOeRJBR5qj+wYhF+cvSsN+NtX88hFalM3fEqoj+LuHRwjDgdxZ9y8vmVx2vxJNa/3lWf0/t+o+2PD8tq7m8IH7M645TUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkePJrWW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkePJrWW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350b1b9129so35439705ad.0
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563152; x=1750167952; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=;
        b=EkePJrWWkuyfRCidnLma/+64Z0S54OwNHR7dckpoVEFVS9D8EqGuEpnKXU3D8vAqeh
         AUV0xbNlv/fWneensaallYZEBoTFaULurJHsvqcGs1R77bYkIgoZ3JysAnUpOgsfOdH4
         L6byVcxtp2fh2+QaKesP67XguUeJB9rFcK8MAFq3L1pSDpO1yfHToQB9mtQEzCVHge5h
         9E02sQkWH53MqX0U7MduoljulIp5FYDiZhO8Q1HVrSQRE7wJ/FDMoxvPoUYv9+/Kk5dG
         8dPa/CxlkyT4u2R3RXQ3PQ7iBhXEGNS5HUkCI0CEJ7+ijTArtacTQK7jzyIMi107/ZfX
         unhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563152; x=1750167952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=;
        b=CeFEVqVOKDmnT4bQfbexXTq2PzPfspusux2J4TZig6L2nQcxW6ChPTEkRXgXnJ74t1
         HYXUO2Dl0UiaLT3ZMbDXdwTjWWaQ6h8Nb8ynncY2KkkEfL28NaH7+zyVEj2NMa8zVD9u
         tUnqbFivH4k2aHXGP1IEyod6ZNGeRMH+HkP2Lk87cBE9uteB5Z8JTnvDW/ugHrybH0+A
         IlPDxJjdLCkps/KX/De4j0Sm71y/RmI8rM3ivkYWj3YtHhKadzEuB8UQtd/pDP4yP4kc
         FPuWKBV6jSw2Pk+JPmQFTvXCXBCgKlKTrcV4ZwX8Wt8IZ/P20Jh8STszH+IedIcWen+c
         S+nA==
X-Gm-Message-State: AOJu0Yyv1KIhXTSKqy2WO3CPGj3Xj2wJmxdxVnR9fAuw5Z1TxgJ46Hmf
	6K3enwwenpWiPQOmYzZifKiNOA2fG9NSyARE4BKwANd6LeHGmDMPhWk0/zBq1g==
X-Gm-Gg: ASbGncsvOqCX9Ld2g5/cEb6s1ph5ReT0/Hn5+jY11MPN0P9s3pt1Gl9kDve4q+r3k0N
	CWsFkLWYP1Q5BpFJAqGnYKRdZTCW4GNYxQZRnlfWyLHHX5JxDJxREu72gn/bAz4WCBJwHgT67X0
	TgjO9rbNAWzyDrn9tXJuZIoh34fGy4yudwv1QM/4kWYFHAvvSw1saLAxxtrLdZQ9scU5Nw18c9N
	Pe9OBVF/hwhu130m2Gobn3qkmZqblodM6h0HnTAgkdm/CGyKtpEU5aew8qnaHiNMK8f3oXbQvn6
	ZeIDhzrzGF8twxXoOSoLPVJSro351bI+//rBQ0pRBf6srTLvSmOYS9r8uzqzxAnG
X-Google-Smtp-Source: AGHT+IFDGAVSPMuId25EXsH25RtuQw5OgumKF7/tJggZDL74R1fo/0EawYSTueGBI8URC4EWYzprHA==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-31346c50561mr22059153a91.21.1749563152000;
        Tue, 10 Jun 2025 06:45:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/9] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Tue, 10 Jun 2025 21:45:19 +0800
Message-Id: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO82SGgC/03MQQqDMBCF4avIrDslGTWarnqP4kJiogPVSCLSI
 rl7U7vp8n88vgOiDWwj3IoDgt05sl9y0KUAM/XLaJGH3ECCalFTg0wGF48bIbmybrXWapAV5P8
 arOPXaT263BPHzYf3Se/yu/4UJfSfsksU2LTaVEqXUih3H+een1fjZ+hSSh90HYQhogAAAA==
X-Change-ID: 20250527-i2c-no-t2-2f3589996d14
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LgWOfIRrAa1vCwGdhDD6foU+2vSIX2068gA8U5LxxFM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcCJMvk3SHQXuEkKlxUtcTqx6wQiJlRzbvCb
 1k/L3QeOySJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3AgAKCRABygi3psUI
 JF9wD/4oTGhOFVoVqvvq1j/1gXrVnR4n6AQIPsTOultTcfH0UuLokbafdBvmOuh+LHbyNrIloOW
 EsbwTfoCxbRwHfwNK4hX6gV6s5xOzmIo9uIGDodKxvUY9CFjOhXjQoV+f6wYyvKzC2VwB3xIqtS
 vAqy9rI6eVqXnvZt+nerWtkyw2daE0YB9JdIEq8Fc7kxBeqEEdyOVC8QLfJXisZ7iQ0WV27Vkfv
 ha0QiRqiuskTve1RBkiVZycdE13EnvyExH56Eos+IOen8jEKxb/rmXg83iO01swEPK/tUvBk2IT
 lJnJNqLHYyEuy+mHZif6bOBrlABZtNFbu0NBNuvnqGmEc4DObkG/Rs0Ml/shZNEujN6h5ITJ3Vr
 sfFro7crRWPPpT/XVOa/ObeD8j6pO7KO0PGc5dNEJ6Et7FuOV0qKCo/970Wny2lfWapKRrbXE3C
 pRFcXdZPjyC2U7q52UWNSot/wZwpFMjg1ePXP1ap07t1XWLvDj8gpVhWU1MV7hmUB+ybEk/vK0r
 rMeA47cCEn+r2P7lx2ZYJgci9AWgsucMybxMGfPaeqDCRy+poAD51BVeo1z6LyLaIwyGqvrJqw/
 bzcfAHuksnzjC3HpJaXaoScK+8eb4hXsGKImzllXPpkmPHI459D9/Hrs88xdquOkrWbo6Gi8AD3
 CROwdhHgypgnsqQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds the device tree nodes and bindings for I2C on Apple A7-A11
SoCs, since the existing driver appears to be compatible. The drivers for the
attached Dialog DA2xxx PMIC will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Actually include the bindings...
- Link to v1: https://lore.kernel.org/r/20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com

---
Nick Chan (9):
      dt-bindings: i2c: apple,i2c: Document Apple A7-A11, T2 compatibles
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 .../devicetree/bindings/i2c/apple,i2c.yaml         |  5 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi            | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi            | 57 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi               | 76 ++++++++++++++++++++++
 9 files changed, 594 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-i2c-no-t2-2f3589996d14

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

