Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD5929DB7C
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898280; cv=none; b=UNsD8Cbc2tR3jC7INAkiy8XFpysDFGoDyuuJcTSkykAR5lIBNC1wJX0AY3NXhqCa21t8MKR2R/EDcnpAu1bT0b3XjUN4fygsMkTglqbl10ddwG7J7xez7NjOa+ixbn3dcF84n6O+K//jfEEVRXRT51pDFESxgGo0apSTLi9ZMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898280; c=relaxed/simple;
	bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfyG9rRh3YqDIphnubTy4A8mzh0+cJAZKEczd4Dwm+8Dcsi/L0CwMNroyoydRoQFU0hR9CiFXo5nu0R84nMZ1w4bG6t/taet4nnmYdNfMz01misUNm2YbBPRyTnUIhVd2GACJ2DNUEJE4/pOEV+QAy/Xa755aykvn8ZUhuY9L4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuaXS6kS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuaXS6kS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301c4850194so4517169a91.2
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898278; x=1746503078; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=iuaXS6kS2onQfh93INlUiKofOZmbRLyPSGWIagXSEpoPC3C9BUXosUG3JK2iqSNGvy
         g2cqAVysdpNqP5U3o0IgKRGi8iuGcKfyv1b59KC/LRWuLpS/xF+L3ZBfeQCnx+i/qaNs
         6xTkkbzjrG655wA/gFcbmvR0xAFcXCJpSRbfIKVy7bkOTfpJ21g2IrvAJIeRoXB04upV
         cO98wCrNIXIrgEybc9Id6odAcUJ3qNf67BietIr9wCUvC7bC/AUbxp3KFKU+MbwgRVsC
         YZ/E2p/Ijolv1U7xlppShP+TrxBQxJb2v77XJ2JFOOaz3Aik3EANpT4nMlTj+jhcM0mS
         /fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898278; x=1746503078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=jUd+BhS6abdTGcQlyCtYZwfTS/HK0oHVHcTgpy77+tZqSdaTHX8Kuc8raqgUtALWUA
         j+nY69BbPSEfSsjuit/2jOUuNQJLVlQs76lS/nBOEUZb9IuAadZqU45E58L9Zde8ZEgy
         7R+VC8ikwcI7rP0n+INEyMwYYNxuiMy5JdNBXfg34AQX2//1VJqlJcPXQVZegUuoMFTE
         8vZdD92xMea6EOW2fNpfYiG3rfKpEbl0wfIui+UFilBplJqiYEg621+IrE7XG1EQ4EDl
         I9C2vWSkrijva+4z+1BwpMFYo4ORDtfl/JDTL+gs8Q6/8R7UhdOQ6i7xsF1KDtxqq5+d
         q7fw==
X-Forwarded-Encrypted: i=1; AJvYcCWyqOSuEkS2WqRI/ExripkegNvj78XIIJYcbRNbAxrumJT7e7lAZE59XfaxcnpO79kVuhj9bA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5DS19LvxWpvH8imJDrxhqrD8NhXc3EA+MeWmonszD1jPBSNje
	tXCBP+k6qre/+lzddm11U1uaKov9nV2WejVlnFqcxb6/xibnKqBh
X-Gm-Gg: ASbGncuK62vyzhIPP2gDf9EuA44+d2UFXi80hqFdtpmi05SDNVe3h4Ucrh9X/b5PTry
	SxobZIJenMrhn0UJXrY0E4mg1LYRkd4quYslskV0MQ1A10I4hFvNjHhKNrMUQ1z9nmS23enkiNB
	qvAhXNmvTznaBamvbh3uH+Gy7YwRR3ztJ6FidI9HMbepgyOj2leYHkPQJfFKMoGNUsAo6Wtq2PN
	NqfVSPEMxDhG595a/qBOvWq7NlVTNlLh6Uk8GEK+ltvU8S9F6fTaE2LW7d2cr9DJtywFrEP0Ldv
	eKAn76Jf2Pf8VErueU7eHlZ53slS3VqroztqJclSz1mRu65zijbPQMvQPw==
X-Google-Smtp-Source: AGHT+IHxm8rT1uzIKYd3ADrbL4R5NMyjZOGRKMbNAB1/GXp9S82eG0nLY3UcJaZeQW35JAd4gGlOqA==
X-Received: by 2002:a17:90b:554d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-30a0132ba1emr16578615a91.20.1745898278562;
        Mon, 28 Apr 2025 20:44:38 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:38 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:42 +0800
Subject: [PATCH RESEND v6 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-18-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErlqBnZpfNvEc5aUCBu7KHe5SloQqmhqGvfE
 tbd8L938H6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JN9jD/wIdllTQLa6ubvW3FYhSvEAW8tilwFBI+z1bwHry9E42ry4qJ46YOeEx/l5swDjNm/hIQD
 0U9VCXRHRMVc/7OUpM2QjGef7+PJJfW8AH/tIk1UVsXshS2w4bjhX0nCsHFuGCcABnnPmpSnyhB
 8Pt8e9wtlMBm067X899femotFvjQAXUdywixEZYnSPfwUDZXRmayFOcsXyRsAuXhoY9SAv37x/a
 M8fh39JtKEG9kJ+sUjbCMClMGpnbVpd0fs5wRuNahh50wGIxacXpfLnwchguFO1cwTOyq/3Rnnb
 avfDG1XNveZOTty65LDO3+bdErUSJhR10if94vy2kOxhMMHYApBl0Snl1IBXFZKiBKzjrLcmyc2
 6ShcYQl6V8l/JLa6flHDYJKnosKVRTg8blKDjcInVRpKc+4DO7M9t6IZUaFSLIEI1MJWvdtEQAA
 TkmzFUN5oy/wtfZgY6fGqLg3NJ1QkhY92DYahM3Pcc+EagP0kklU8jQL9SNBspIfjWiPKwhb+xM
 bLAL8h/zgJZp8F5tC2DuHY2Zsy1bPsMR61wwsfBqIQMRomNKL2uc6EXCje7pCbcG0NFHzjA/XGE
 PlRM+kh+WShS9fcLMugbZQX9WOFN2mHNWRc+O3R/XfeHDsseT8U9PneTBJTTdJaax9yJ5PuG8Yx
 mxmYwJEk3r8LfjQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.49.0

