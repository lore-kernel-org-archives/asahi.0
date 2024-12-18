Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764641FCFC1
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546559; cv=none; b=q7kX8R+PxQRV5/XiVmT2mnlHSdrcHMua7KMJsTFBpfVRThASV8c0OxyL4YgudhoGjy0iGN3yX9jZFq7/9mxqb0UZUXHdney3yR4GMxPp41lJklFNA0BJwZvd/TNvW3QQLS7B7hZ4J1YiknPsQQJfww2S9QtQftv+0uYtzVULgIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546559; c=relaxed/simple;
	bh=fCCg/V03dlTVApvfdzM+UzWAAxzMgivnQ9qaZgFnZ0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYNn6SoSzxaHScbAmSS9mBpRmdViulZ4LwSKYwjqUOd3CPe5TLvr7zR27v7P28LzA1ndPd3CaHXYawcSV7JI70gq+WYCfQsDGeEvIilGsO3adbpdyYIjTRlzwFISfcwTW+WAChx33fDvi7HOAli5NsywQ4PZEjeThZyPuA8nkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2+hwNAM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2+hwNAM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21669fd5c7cso60811805ad.3
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546558; x=1735151358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1e4i2yJb6M8JWolS3FF1qtbGtdKGQDJ3R3qFDxNx2w=;
        b=M2+hwNAMqooq2Bn2Spc7dMRq64khoiIdrrdtPG4olOex5GeUV5hLvcM28lUWJ9Pwla
         o6SNap/pu5DhpCkZk2fadCbOy8GAGydD8dFUij5ujaRHgKZaTdaUNTpqzGf8iy0blV1E
         noGMnApmR3kB+UKpY9x4nklOsNumehPJqGsXXdj41JCddWOjyr10pK0He3efmSUuUG7L
         GUiL9KEn3EwYVYi0oATra5yCbxWz1Qd6sEqXivZna42qV9bw/vRI+ugZOggEQkZADnG3
         nNlQ95HjbnB5TLOCVBR8PoaeGtjiKB8ZCqCL8Pc0WSH8YJNHjMjI2lAewywUMQxwvoi+
         gacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546558; x=1735151358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1e4i2yJb6M8JWolS3FF1qtbGtdKGQDJ3R3qFDxNx2w=;
        b=JXNjrD7Mds45VJGEvEAR2eqKrnY/Z1EXsx6XWiFtzfyF6Lf2YRVXMP8CoNe8aHwIrs
         OP5VVTnvRsDq62EWBa6CKRXeK9VMLsyPVHf6GZvTzHHtBOX4fvrWZFQWeeegt7tFjhwc
         zDrv2cw2joiybQXuEy27vDeUSs8IBn8iKTKcIeBZHXHQCnwJThvlIoey+X1FaQ6aePf8
         lSjAYHpgk4uLmPQdc/ZOLma3CzugWbRx8GD17NAhSg654i2F8FbKc5u7//8MzCkgxnbO
         t0WQdaHi3tyDj1FE6fq5f5WP0CM89Bs09X7uxAIYSYQUHH4UiynEMGdCIxR/MlxUyx/W
         eKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTLfljQNrTUp5j9lvwiudBC28K2hrmYz7girwnGoKnvj7r5nj1wekv2C0fPhfFDliuE6XN2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbrLG2lWYYSdx2lkSBUBaIUMsIbHIzx8X9zoUHwn7xdcqirvN3
	MPM2/fSYm3CJj8wh1dLeHBAFI9WsdzrABmSTGuCQSZXx+3rdn9cd
X-Gm-Gg: ASbGncsz3Mpzz8ioqF3k8C64juDU1XCZIih2ByIrpH+VbDOITVC59RqXVUjUY9NKtZj
	WxEQ+e6h/ReYlUB5HQuWAlCxehNgPG+7JoOmw4QdJlfCxKRPuVmGJ7Iaw61tknH/woqfS6lfghK
	mDcVKp+LeYpwMY+07DXnGwZ+fWQdBLJeKOO3SHxMxKba+z2Hbb5zTnlst4MhUTeN79cotoBZsvc
	7OyePzgsmxARNRAO+R/RRLxR5LJow9Ufrc/V4OPj/K0Ib7Dx4ahkAtvbQ==
X-Google-Smtp-Source: AGHT+IHIJQZvEA5f5MqvLKQRVSuowhIimcNsdQUZGQd0bWhhesTYwzAxxO/1ARL7Nrb4NCT2ZfdFZQ==
X-Received: by 2002:a17:903:2306:b0:215:a190:ba10 with SMTP id d9443c01a7336-218d6fe1a96mr58866725ad.15.1734546557853;
        Wed, 18 Dec 2024 10:29:17 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:17 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v3 6/7] cpufreq: apple-soc: Set fallback transition latency to APPLE_DVFS_TRANSITION_TIMEOUT
Date: Thu, 19 Dec 2024 02:25:08 +0800
Message-ID: <20241218182834.22334-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver already assumes transitions will not take longer than
APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
makes little sense to set CPUFREQ_ETERNAL as the transition latency
when the transistion latency is not given by the opp-table.

Reviewed-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 94e57f055a5f..879ddec9e557 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
 	if (!transition_latency)
-		transition_latency = CPUFREQ_ETERNAL;
+		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT * NSEC_PER_USEC;
 
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
-- 
2.47.1

