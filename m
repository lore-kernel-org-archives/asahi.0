Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B65A2F7AC3
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325654; cv=none; b=H1DtBf7OYmYRisGtcEtoGEhu8xJ6QSmlZTNwrAZl81q/86+DYNWckaUKGGYfGppEmsAfa82WpCkmjNlQH8InsShWlMCl0ZjaNCIymG1J7IlVSY6IGH7fr6OoQKeYuGndA83XCd3YnvmR02+M0Auv3Yve4NCIt3quuicNp+qPB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325654; c=relaxed/simple;
	bh=LWdyJWF3F8SjS8P7dCHoXr3nix46HR/GnW+584oj+64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSLGOpmzZIxcPbC5UdtXwPh2IPitQfrSrfwjfoGrzHARG65t3ODNhZAq7wKlIy3Thp0Zyimf/KEV3tFKVToGHTZL9SsQgvuTuFYJpyIsf/KtfV8lpGHOOW5xJQSh9xAyklMyVySenFapXw4jYdHCPqAYtXOj/8/HzMfep3y6eDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN43IFc+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN43IFc+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2570bf605b1so6047255ad.2
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325652; x=1757930452; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=AN43IFc+kMBEHe3by7WKiBWDG09Yy4tkIivkqZcZ30yQ3EW9iPPJIfVIm/8YViH7Hz
         U9vUxtfx5Oi8zNGkMFbNT0xGyln/rOiiwVPe8ssIQCQPeDHj2exY0V7Wtdg2mQrPGuYI
         S8Fv9PtQsUrDT/lMbhCzYzjm2T4zXnLDstzVczeDueyRsOLQayXQVa91Gnkc8lbya6Qm
         R/AjHz9LQcgXfL7DzTd+OV1/FHDaV0O1TrYmINQTZHXJNacoL1RAyRs52NYixCRDuJ4K
         ICszLS1BSNEUZLXZE7xiZzONIGhLbV9CDQPWW1qPqniaW/NUQPfG1XFYuiPDu4fdVZO/
         vrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325652; x=1757930452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=VEE3I9DRgC10VPEM/B7i7S6a3thlYswpXHUGtNgQLhCSOZkHfYcwnBa3LfgtsztNLi
         dpaKhypqb25WOKnlqzPJE/IylR8Cu4WLxIdr00d7JZDpozOVkYjasCuWrPpiV5QFCW0Q
         URGKG4S9z0rQa0wFaaZLZZ/l7hI0CCI14z0lj2AOn53J4FnyoqbQ5XK8Jjhlvnl4Sekz
         xHt5usSKwsoaonyU/Atrp3+/BIt7c5O4GtSidDiQ2ya2r3A94BdD/BlowJ0ERu1fF+S4
         6Dcj9Tv9ywlvxyUUivA7PTc54kZGsOTdh/pCTzjWrpzRSdsxydQjLlHwTYCPd009l73R
         oBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUof/vGzR5RzdCWdOfM2i8Zu+1BAWt+p+/QcxXX93X9KJXTAPjHu+ve2cuT+OCyeamdyt00aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvPjWAfO14RIj/2b9t0nREdL+ZClmxjuv4ZHVQ/WeC6tRxdgDU
	FtjyvTzs2KL/pvgzt7sIyrOkoYZq9cYJZljdBF3VK3tzJXNvs+g8ticf
X-Gm-Gg: ASbGncuGPVc8i/kfAdgvqQ6Mkx/bLKp30wVnTGXLuuiHKPnQCigi/Aiz7pqfpkjnXMY
	f2z+naYz86Ofd9omN6CSbd83M8VYrcMayvkWL8Z7BwHtvS6nxMtLlgA+fJqK3CYnIoEkVuWHGN1
	7pq0gEPKceEnpaC/THA0+1B/fXD3a6HyHn4vl+GcrgtZuFj0dyM0z5rm+UQACAmV7EZxicOsBKs
	Hztxx7CmX0hW0LIGzLsj8RZ3p0Ubbq5xScb52ueV+pmxQv1XzJ5lOEWf6U8iG0jdQiN+N6ehFWD
	VfypMd/3vGIQtZeNz7L8x7yoa2PJdzbch61RH/8NIW2JApXc994bTXz5ixYkrj7vYRloF6lt3rA
	zEKGnB0hkOpQN8uWecq3FDAX0h1IMgQ/RFXW2sA==
X-Google-Smtp-Source: AGHT+IGl1vTxo4904OtH4SWs6LUChVqEb8VgEVVJCvo1a6Vhe/4uyjIXKuDfOVxqGh5ob3vqwyQS7g==
X-Received: by 2002:a17:903:2447:b0:24c:8984:5f87 with SMTP id d9443c01a7336-25170c4177bmr88762415ad.28.1757325652051;
        Mon, 08 Sep 2025 03:00:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:26 +0800
Subject: [PATCH RESEND v8 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-2-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LWdyJWF3F8SjS8P7dCHoXr3nix46HR/GnW+584oj+64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlCU22oAvgbtrscdWyafurkYoZy3NYlLu7IW
 hWt7fHK+GOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQgAKCRABygi3psUI
 JOdlD/sFhoqfCpqj7FgtxcF7snNtZue8D3D79Nk0lMIuUtqH/nory8bTsgP5FO/zDHh+FzhBEy7
 GJUG5aMxsMgWbZ4oOhu4BcJsEnQ/HSTwuGElbI6pqsP4KbDS1zIvx2hOJNuJRGbx6jaB2f3ey0t
 2p6/ABbDkq4/k+u26kcWYqUpn2dIdm60CPY9K+w8ymRjXil5oDJtvofwwxxccAQamA/PDtC9b0q
 V1iGE5JMO009hyP5Qe0XzUMxt9p/Xyep7q3SJy6/njas3ngxGwhm3J3l4W01bLaA8Ah/ClLiWYz
 S6se+MQzcAzrjnvg0UEmxRuIprQ76wagNthUVbO6yJ3MAWWGl8SboRYantMnCentWT5VNddrkcd
 A/aivnWTHEZ2j4v7EiqlW2rHR0j9cCO1DUMGQ9dh8HbZKkTs+Tz2qFw8Wk4tyLZs4+2ld3h7QnP
 NjOm71HU+AcueUvdudSQXiQwFFwb6WSBvdnod6JRmUo5ux5T2oFav2FobmJ9iMAewbs/ST6M/Zd
 VxA2irnqTESdTNa9WiNDiXkriDS3z05nttR2zhuQTXcQmlplp30PUVF6IwTMeL+LWvX5xEl/EP0
 JjX0qtoT61ruclg+NO98M0UvrM2ll6YLMr6gls5yLrceca8/2rMdUo5cbp3nmCSMNd8Zk7tCfB1
 PchvliyKYEioyKQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.51.0

