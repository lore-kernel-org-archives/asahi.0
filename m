Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70734D92C
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988702; cv=none; b=JgLRzcfUbPRIpk3Vq6xDFs2wYy13oyGf0Oo8EPlYcpErTPFh1MmhW6gF3kS2UXuCEhHRA8HSYtjnQQOw43FyyS0MshNIF5/KgXPYfnHko3rzHIsEqjr6b2LpBjYtIPPAg2iKvwbgXLXIThIbBuiECuQWkmLouFZUMi7M+3xZ4ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988702; c=relaxed/simple;
	bh=EvpktAwcuUmIVDFq1R1ot/bW7FD9M9oCQoJjxbhIT58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xnm8mlPEHeCfqt7z3dfMsUiFrGKZhP+vCturwmAg4LV1PGKruAXsq3Ol7bt/YCn2bG+fF/BbWWvq35/oVv+TkAX7I/CpPjaDBI3V+ZZ4gXBC6MIwS8476xdcq+D135W6qN0NJOVm9e3/0zqPHU/T28deyrpi6zA2GRVgdTxf/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2nx4xEA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2nx4xEA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0fe77d141so40051305ad.1
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988698; x=1766593498; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VV04TP1qOyPuEJVZ8EkDOfgn7C3GBNsDLm8LDcSrTn4=;
        b=S2nx4xEAROf0OvHTpFl9CUlM2ntpDKoWXyymUWdQWLTjZRv0M4tGKh7XgnRUb3wJNe
         bh5kziIlBIfPdoFHBSxu/lL38uAvGGmzts1W9ZKGdWj+oYpz1ey4BU65ZuL0vC6T6GKx
         fgN9APqegM5AC5duBvkQW8m8iesdKGfL/rWkseEnqlI30Nby9QzvVLVBgeaxUg8anMUS
         H9DCguRyAG+QmGljuDdOTk31VP0+fB7FqX7SUTzsvA+ar3w6R/pmCQ9irCjC+mkGFN2Q
         8LnsCJey4cWWWQHS2xsl5+K2Xl+LxUEhJZXrxKJOjvKj2QjOp40DT8hjSxLmHB1rS9Qe
         lIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988698; x=1766593498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VV04TP1qOyPuEJVZ8EkDOfgn7C3GBNsDLm8LDcSrTn4=;
        b=i+7O9eypYaVnN2L62leohnKRKrAxCdqBfd6r1jRTdoGQnQGU2dm8mF0fOk1H5zjrWs
         7SintdlbMe/+urWbYaig/y4uk1Za1Ba6ThlaegR54No+wUNAw+YoOy9i+bIDTqmqSNTn
         Q3kliq/QbLerZfrQQAO8UMwysJHmeAPRLIucfpy5hCYeUreChsIOzFMsdynxt9HaIylX
         q2Yd9n4o0enL62kVy9YzZ+a0C9MtirLAWfJ+pcB8n7SHzzdMzH+Ctfo828xLsBYX3jSu
         lPh8v+YEXrL8D2dNLXcUQsIP4YhhGYrHQIrmBFhpYU2CHX5rNRwb9eH/19Wq/Tl1+SkI
         xf2A==
X-Forwarded-Encrypted: i=1; AJvYcCWqlDG5WxMNeQFENS/eWmiWrXAwt3DbPAXLCfQeNFx5wFof53FihCA6U5303l0NYSisS4WsJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YykWABZNOzz4eyLZtCjdoQ8Pm8Q14kzMiTSUyZC0Ao8rnRtGNzo
	5FqJxmGmWe+7/pdfAtWVuTlv7AXtzqoQWIT6/HKWHo6vCf9iGrqsTr6PBK0CBWOi
X-Gm-Gg: AY/fxX7IcScSCpurro8sx+1sDTyPReKbBbhKvI5NfPfawaB4zZ7Cqca5vr/2lv2jknY
	zvLhFlR8buxqArtypIoCLL7QpOqaV0Fk8lirE3W/YG8oPWUGeoOKc8ECx3IgFoZhIYMJh5q6K0E
	OrPburkPD2Icu5W3EeTSwy81szbxrQIra1mDScEHWxZSveBoX+B4LKHZFXQlrpB1ij1RwxGqIRa
	T8W7CVElHTe4W1GDoquXVYqFcPIe38fH0GESZ/KQxhwtRJLTW4e0nnGIVDBo/qSQAgXNBcLAI+g
	PwEST4V02LXofa+SdxqCYfW2VYvLnwx7HBaGB0ftN/WLt1ZaQI12v94i7TQXQiEBTxY8x02ojS0
	P1xbSz0L3ivMlvfwtn9CJJMc/uPZia4YjQPDd0+lxUNvaYMn5TeadxNveAPSUvslsXQRdzx9cW+
	/CbQougNZDm9Wq
X-Google-Smtp-Source: AGHT+IEpTD54HFdeMnaw0VjZN9vYnC7ljfIwzHHvSyRXdlKEsVX/LGgWNkU7U3alrGNq/8FyZgpAeA==
X-Received: by 2002:a17:903:1b45:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29f26eb2a1cmr188775065ad.35.1765988698277;
        Wed, 17 Dec 2025 08:24:58 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:57 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:19 +0800
Subject: [PATCH v9 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-6-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EvpktAwcuUmIVDFq1R1ot/bW7FD9M9oCQoJjxbhIT58=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlA5q5NsoNM1LMrGXCePOowzgKrUqQ5mi42o
 JBGkhTTFRqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JE6kD/9DDhF4RO/JQidMPAlnqSVBd/rn9UAjC81WNu/nQnhSoMkXh4rdDE8vZciufv4QYb5SHVt
 QsALf8hFy8NJUP8+I51BSwqEHtNPQoJAFZzKgAt67v16ZQ/yyDHYPhY9y8ZxmEoljjFGCSsfRoZ
 7DzFgEnkPzogAVTazoe17QqJgIuTAEoJMm7TrG+WC97CDwCgUjxJkA9cvt8Ftv7iNgu05124gOz
 exyhpXoV1ZW9gX7ZDIA9UBTQcm02nK2GekfaInFaWlnULiMfjotmGu+QewVU+GHG7uZO0friYTL
 ayTSCvbwYwzjw5PODzRpzKQbKyjh/Z3WC5npjLjPOpLAB/evsOiAthhiyhxdYVmd7Zojv2JdpdH
 XQ0V0AEVjB1Nsh28NwC9IxpbDZdl3k+yOIu3yoKcFftWTWrOAVKcmVsPJZGPWP3T0rDhln8ujk6
 Yp2PvnOh9IYT327M0oKe749VDt0oXMT0pL+qxfgRXlCb9cpPlk0iat5MbpCHuLGKeWS3IbRAhE6
 i4Ie1S606zj9ud1IC1Uz9YHzG9+LLGt4j2lztc5NbzgcA78gGJLEp2YMHNrwJ2iGLcSe03jyYie
 gLn5aHAg44Pw2FOdPsvsmk6mgcqXPOQaiRB378X2CHxvOi5j+hw5Q1osulsXl/fucqYcNJYExPA
 a3XIWmgZ1cngAiQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index fb2759069fe9e47146f0342fa46e40f3ab836926..303c0e62432281e899a33fc197365c70078d6ac1 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -659,7 +659,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -690,6 +690,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -699,6 +700,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -708,6 +710,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.52.0

