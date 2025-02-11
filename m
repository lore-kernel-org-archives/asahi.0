Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03894257AF7
	for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290109; cv=none; b=fOJgImCkVI3/NtWYv+xf0YutCH/2KaoEZ4cXyvR4Pr1lX7eJGyf51KWyMScNfK/9zUzNC72Ha7EHEBnnx4e9RligIN8+FI19rccMrewtSMEOJl8jKIF/cn+fuwlx1j3LJ4j8jg46mIC8wUcaBBUXRhibnp8QtG6ouqs8hooxFH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290109; c=relaxed/simple;
	bh=/xQSzk950FCuvtHGQpngGIk6ngOfd9HdKv/UR2YVLS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqOqD0gO5YGEEkn9mFXhoQqpRdt+7X7ovNh91RElNAcPfgsErox5OH4d1cQx+EHhgEaKeUYKqbefdNZitymU1IDiO9bTmLoNJiWfYjJ5c/liuO562wp0GchWTBAsVz6lH8Gbnr8RZwfrfNDJ3BdlmHZJ0LN1tsAH9grvSajygCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXMjdR4w; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXMjdR4w"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa48404207so6286239a91.1
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290107; x=1739894907; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/bCCPIxn4KDDZBLFDUwD7PiQhomaVfOF5iK7lDsvVw=;
        b=TXMjdR4wXeFkfRgZQnf8J0IkT5VshGFhikuuwGGX06WX/0jj3Z712zItR01a+62erF
         OnyOxsUhHKFkpWJi2SxYllL58LefwGtcKThBdZ40zmi+i+uqdJpWbqMKnDDBuPYP95br
         fpJ+X0jzx4tJiWcYcsu+NMXIgsYLsOhg4Glv6MkraBFr2Lh3D3zQVehysDzOt9iie+XD
         7SDozbwvIy0RZU0xy9yWavkuPZ3F6L29NpRAcmWuLV8wUfqtP4L+l3jdoM6QKnZp22uf
         /vv9g3tlUI90uVXuiy8jE6QP8b376g9fYHCfBfpLCJZr5Y4uVNEujd9bjC0b+u3zkTVr
         acjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290107; x=1739894907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/bCCPIxn4KDDZBLFDUwD7PiQhomaVfOF5iK7lDsvVw=;
        b=wFkydeOFH7b3NWaARBTARZA93oxsFzXasLaonUz6MsIk9JA/DDVqdDPCKNJGNWOrLS
         31qPJK36ALbndyZLNBroWtQJaVS1+EC/LzZq1gCXCz+CJMkXBVhUZRok75Cs9bbwqq5s
         94GeVueEqJxJokJtauEMTn1WW2oi8ZkPEh9kWR2F6dfq6gVLryyUjvmn0T/c+1pgpw2s
         DAcbteHmCrhF9qQDBuc9mXtZkOMpU0RO2EbFcTcymskLcfz5y1XjoeY4GQgor9uNxpXF
         Pp4xSokpYfx2uXzaTnR7o8m54yRzTDPBJ8liKHIG7cQuPPAjcNiIINX2VTiW1yyoIapK
         k07Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPEAHJ0rUnDLZRAeiXDmcY93OeUZ3CV27RZa1498kBaP1yJW5qFC6rEM4+vmE8bEdwISS6pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGtfEIGcQFM9lNlDnI6Ovl4rpXXUCe3fBthwRF6fE6EpfCue+/
	SLINzhlEBPo/Qd8H+pMZfnvH3+PQfpKkATXNQsARQdjZrq3s26a4
X-Gm-Gg: ASbGncsi3cIT22yLEh2pCfJEri2N7k69oA9t9HlxDFvet6V0ygQPpqv3T+XvOElXrVl
	DUz1leG6x7WijEQqq6AD+uSiQS9WjvPqVlhBHCmijJURdqNv5OQCTfklO5RfZM/z3vbVDUylwk6
	TWhtcmOHijujRnOywCNdnUEUppHW50rDy+WaODuBRPejmvmuDc99BjwwdPXpEIxUghc07U3I5Qc
	SHPeaGZBJrwzQBkYsGngxsj7iH/HLyJnPdr0USNyMudfRKN6tz0ulxqrR3LoTf01RTyfyT3qjjG
	nkofFdTJ8QrJbdw/JQ==
X-Google-Smtp-Source: AGHT+IFDoBSLFXS8fc2oKxZ7u11430kH7lpuCMLsImbDx0eDbX0du8ImVtICDjL3/vMG4Cm2HPnt/g==
X-Received: by 2002:a17:90b:3647:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-2fa241776aemr27656016a91.20.1739290107060;
        Tue, 11 Feb 2025 08:08:27 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:26 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:26 +0800
Subject: [PATCH 05/10] drivers/perf: apple_m1: Support per-implementation
 PMU start
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-5-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/xQSzk950FCuvtHGQpngGIk6ngOfd9HdKv/UR2YVLS8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xn9nZDkPLT0KDldq05E5uglg+bM8uK4wN4T
 UIOBBR4oGeJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JF7FD/4wv/qAAOyZdCHLlU2G+92h/urYiFuL3iJJOQ5sxB/pz44kEDVs9qEL4Dy9QvoUYnldG1P
 tauf+aYAe4YLqfeicHvZNYljYUcvTQmpbTjfPTTr9gkAweHEiRJDKXszaioauKZyLGn8Iy24Ss2
 gjEbPZRw+eoaO7K1PtTKXzK4vczJuV71a5Kd/uscSzJbrqV80sBTv4frJkuxcdU3KcxjbwuTeIv
 jkJibsOCUPhIdRew5KVoeFtnAaerGdGTwK6hm384aRdHT336p+hEO+6k8RacaCZLxfNLRMEPXDN
 tl4f54G93X4MJrUzMMt5dPh4JH/A+PQ2ADKJtWnKdzYFF7GWRkM7tQYkEBaXYMpxfshBDDJjZmp
 EKdvD2Heb/qqF2ivHp5tRPG48BV3ivXH7ZaETcDeNzetX6VaIVwPMv35jw9fVrRrZsMIgv+MLxU
 QNVyB/+dOjnJ59Oof+9Z/E0pgT7N90MpS/pG18fP7EiBSFJ74BUP14cISabTNY60rpcdLR9D41O
 5UHtNR7WzCyzCvmDKMr6mH4q7lMf6djqpIjEWVp5qUaX0pHnKolIcTygmzd8GvQrdlQwtvuY238
 uG8nIgpQJ/ygvxt/A+vWw7LR8S1YNrnxPatPvi5vHWjEF39RULSbcqvhBmzMfpEHVYSpRH2cNi2
 9oFASIjH+CeKwLg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation start function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 06ae20332e79f7dfa819f764a3752fefe53bf5b8..39fcdcdb9e5dd6d4edad0a182dbc2eef62780d8c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -605,7 +605,6 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags, u32 counter
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -622,6 +621,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
 }
 
@@ -631,6 +631,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
 }
 
@@ -640,6 +641,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT, M1_PMU_NR_COUNTERS);
 }
 
@@ -649,6 +651,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1

