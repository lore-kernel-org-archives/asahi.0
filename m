Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4A267707
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543450; cv=none; b=LcVzVluXvu7rhWDTw9JzOyicERFjLdMCOw/OfUxpkpdOHa/1h4Y6tZrKlMB/2eo5BxxeF6RJiRCN2wCMgG4mfG4r/IOHlCQ+KZp6CmRljp42qEtcZRyvg4LCVIms5YDvT3ry85l+lZ9nFKef6DNhY7iORyHD17sHykTVWkkgCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543450; c=relaxed/simple;
	bh=ODunfawf7CVe5hX+5as3cMBvBCM9oIodivRV8l+gVA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1P5pRzoOTjP5A4EEQwGpMnFKYQ6xzugM/YPIvhOTPdBwNHQcVnfji+K88BcVp3YRwdAvxRIYZAPK5nnVCOx5A/UcXoZKX8gddpry64y+aAYUzoB2wR8Ao/eAtZovkedYNjFZT5EvEATCTQyymEc8mJCpW1SyizcHxLN4iC2LMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwLFJlDU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwLFJlDU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220c2a87378so30542935ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543448; x=1740148248; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=;
        b=fwLFJlDUYfGpYjing8kgjf+pye8oWhv3uskRSO8xjOkizBzGnWtpXYDu13PBbacreP
         x6tAQcv+SzwLbiJ6xfISV1AiVpxz6j13piKxzc/VBzZv7zlnb1ZAljijjeUOuY+UCU5c
         z4mMqTyA+KiynppgDvUuImV4/PUlG6icDCQ1NeFfWzpvj97A/ewU/AqrYWZzDYliKfJd
         TFIcCw+8Gp3CXorHbBlezOmHhdm2H9C9RlgDeLoGlgmnfLi2FZ2Rr3f1DtlDgwGG1vED
         UaobFedBcaXCCCDLqBOzYAbPArJXiMNAd386u3YE+XwlQWZxOyo1bvXyBHefuluH/+bP
         ud2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543448; x=1740148248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=;
        b=Q0fiXDwWkQd5t7WRtxgu5P57cgBHWzBLKS3GJeqpTe6TuHrX5PKZQLZ6GxbpwZ+7cL
         SdjY2u7TKq9NRzLnwvsEJQdvNYHetN95UZpNVKev0HnintEX1lZmtDHTSxjcvcJmHjb2
         f3/v46/XxoG2itEN3Nlhi7CcEZAU1tbSsAsL27kL4aiw+q4n5884eRUKvpEG7ogNpTm5
         PFlDd9sd3xvhFRjn0C0nUZbiUcRbgx2D2NeAvjTGbalbyQIDZkavU3/2iDPMQ6CbjuR1
         irIVGs9dtJyXzqBpND9dvW/lt6pvG7dSMvB4MnxH0EiqRC6AJJkkZX3D6v6fCr/S+6rT
         XTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWircWc5DiU6O9NcJqDNry0qsTD9/wQzHFLhts4Nk5G6oAYEY0y2uX1mWbuzb06Edw6sI7r2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYEioTaHwI+5wTIaM9pXvNKF9dpDh8lbu/hGxBGgEFYueipXUE
	5hfTsnNWjfizm2S2Te5zXSIULzwHd1/UvM7V0P0cJ8/lZ5Ia0XydJZpG8A==
X-Gm-Gg: ASbGncuvag89K5elFFkm5Ryh1SoinFsIG1QFgri0swNcCrGvrkc0wBTmb8sxcOtHxKE
	t0lurZ44WZaDA3bN6N+r/wLyQAIUsWNGVxSLn6kCWUdIoa7NpJ5udFJXoGU/FzpT6RMr0M3VrNG
	2oyQjrULiLRn7tui4/Ry2nuioQ/JDJv4C/1p3O1T1DohjKF0FpXLLbeO3kLOsPxM1ndzsgfd3rW
	LxVDz/JHsV/JntgsY+mdGRjvIPj8PVuA1rxuiOu8S2RECbAJmQ//WivZOVTmlpC8NZp1xBB8l0r
	6HNoTniKkR2PbqR3Ig==
X-Google-Smtp-Source: AGHT+IFglqPtbNOR5d6lPNgfHapWAMCKOc/XtNXDkRhnLODWQ8FuM92j2yXPlsrbIGhvAMP7bUtYFA==
X-Received: by 2002:a17:902:e551:b0:221:1c2:2012 with SMTP id d9443c01a7336-22101c2226dmr5121005ad.49.1739543447628;
        Fri, 14 Feb 2025 06:30:47 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:47 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:32 +0800
Subject: [PATCH v4 06/11] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-6-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ODunfawf7CVe5hX+5as3cMBvBCM9oIodivRV8l+gVA4=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OANQD+IsUSDqrlORfp2jkKJ1QfjHu80PWed
 wsiCyMmfLiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JJ8BEACp0B2nKDD0n9WAUS7AUfltglql9y7lURBC6T+c1+vW0x6Je4TI4EG8CG+yKDEjyQEL15p
 NewACnfSOBVXdxztSY+6+NvYRbO+W8KZgDlbM4aOAKOg1JrEOtigSYje8BqJbcTWwDC10sIAzSN
 vAeBN+rANWdrNouVd0H4CCxfo71A2rKPX7VAtQA1fFOuQtS/UG+v7t1pgltm64gCXZqIywyyEcY
 vgJfZWDLlg91TPdqKrHKm7fKQK81c+bF+I3Fwc2eeDyeIhmx8nCTmJ4vc4BwitobujK4h7Mwcy0
 h8Vzqcij+mPbzO2JRwWnaVuI9ngQLF6baMNd4s7+dKxixy0Ubav/CSXn6QT+UWm2w5ibSPxlhiC
 erl8bLI9FkEUg3jS9/LljeNidQOOhHaIuLmWim4Sg5biRxitgYnCZsV4o83a0eOstJvmuvm3dWl
 dWCpf/qltjbZS9dfBYgiJQ9ZoqGRMV3tX4IXN/RNw8CUeGqJf8p63a26N+rW6VEQeoyGupejGxS
 wWfyiDPKNt0hhn6ygb/2AlMgsFWmghqaaZgAapSOJTXjtTmxcjDexxEXbl5F9XzdgOvTQEJZEWh
 DW8fpWzU/U3GHBHDe2blGQUT3Wm6oFMPVfApfu4+amZjmISqbPhftYJEVBnS6a9RHTlyEOEIC2o
 kt852ZFaa0zC7RA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b601d585d204f9e59ad7f5216679b97852a46a04..f98f3e95bfdbb5e9d0fe66357f6037f056fbf25c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -612,7 +612,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -635,6 +635,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -645,6 +646,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -655,6 +657,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1

