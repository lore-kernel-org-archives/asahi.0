Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE9184C
	for <asahi@lists.linux.dev>; Sat,  7 Jan 2023 09:46:52 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso4287960pjo.3
        for <asahi@lists.linux.dev>; Sat, 07 Jan 2023 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiIDHLmR6Z3DLA7ZmBUtEJMzeUne5nEPIKyDcmHBzVw=;
        b=yJu2zPLq+s3FH5mEbGHQnaCOt/fA1bkJ9uAuTdCgzCGYTMFL+vOE4qNDxb8QaYyqTT
         SmSc46YwBbIloQzijwBeh/41wdk9+x746aDufVmzZgqNxrXtG5ex4N37BM6umBV1A01X
         YNHNAMgbrMalLioaSGoV6M7TWVlAUjJ/FlPCJ1kndfbS4VpAEi/5RS9tXJvApoOLWpIM
         GWFqJxy+Ol7XHPIbWNO5RZydcFUH2Ur6+4RJPELKzDnoKNjVXYaAdJqdBJ7WDysSbxN2
         Ysl+pE29yF5jM8zHPA9XPrevwOOh5Dh/068nECqwqSvwROBS+8X0Z0lsEgYI3X85o3KE
         vnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiIDHLmR6Z3DLA7ZmBUtEJMzeUne5nEPIKyDcmHBzVw=;
        b=nceOqbg5BHqgHiac2zQw4vQaPrsio00RJ2FWD3TiTtOlGmC3XDJ83WBNEDoXhrYTg1
         8sEuVY+d18Hg8Eour65ZnZRP+nKbnhLaVzK2h+WksTlWlAW949PEvsDjzP5d0P1jY4jx
         LwaW3GLUwBOXA0rVNksFF4sIDYiqImXzdx7iYIrrGyUtZAjvG7Idt5gJ/e/oHucmhEAU
         yZn/EJnsqYdW5E4qmn852m87pkbFasmquYFWvo5Oh8bXD6VteaAhPhYpwY8YJ8vSv1m/
         k95IgbCUT0hlS5tlERKX2S18jBCb3TzanuhYNS7wBm9WS8mIDvIDiuT36ccrIbZ2HXlj
         wxTQ==
X-Gm-Message-State: AFqh2kqE5SAFwJp20Tf5f9rHgbXA0zpE61eOSMx6kz5GhtfcFJ7T1Jz4
	/pwxyfG/6EhInGfSkM5sDGTp0A==
X-Google-Smtp-Source: AMrXdXtmYw6MgSdZBfTMXKijPPEzf8bJIA2VpXjIRChc0KKR72/kDm2z6Pxza0jgOTVy14a/H48EyA==
X-Received: by 2002:a17:903:181:b0:191:1b93:e391 with SMTP id z1-20020a170903018100b001911b93e391mr79420228plg.63.1673084811969;
        Sat, 07 Jan 2023 01:46:51 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902d2c900b00183c6784704sm2263449plc.291.2023.01.07.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 01:46:51 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	asahi@lists.linux.dev,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 3/7] arm64/sysreg: Add CCSIDR2_EL1
Date: Sat,  7 Jan 2023 18:46:25 +0900
Message-Id: <20230107094629.181236-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107094629.181236-1-akihiko.odaki@daynix.com>
References: <20230107094629.181236-1-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CCSIDR2_EL1 is available if FEAT_CCIDX is implemented as per
DDI0487I.a.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 45648fa89be8..90b64697345f 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1663,6 +1663,11 @@ Field	5:3	Ctype2
 Field	2:0	Ctype1
 EndSysreg
 
+Sysreg	CCSIDR2_EL1	3	1	0	0	2
+Res0	63:24
+Field	23:0	NumSets
+EndSysreg
+
 Sysreg	GMID_EL1	3	1	0	0	4
 Res0	63:4
 Field	3:0	BS
-- 
2.38.1

