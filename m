Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C652C1DE2DC
	for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269284; cv=none; b=Q7G0LURl1t6+wz4akqy/OljVC+Wofo/X5ip0v6tTh/UUy8YzH2bw+ZW8f/Pag8mZdwdC30n5418KPeNkM2zi5cg1uoFv+ZVKD4KtnzQyHKXsRs1tjDQ02lkg7O47//xzlc9F4OSmXa8l60ZIdfWo1tz5Lo1VtyxFicQlSnToj0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269284; c=relaxed/simple;
	bh=hDRg0YaHnMb/3mj2Hdxk7ZixHZuwBUovjfJTVCdFUAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgAg7XRBb40kAGD35DeRxteXIZAsPoxMnZhGLM0CADYa5CllkW3hWXebpYEBcZrU8dWECZ7qu8f8+/4a2AH7zWslX/7ceM/1lGZLkEZXFhzrZVbXB0nT0bzV74PyTbs9c96IY7P4Imsx6Z1W9CBqwHtxfP9T8trm2Kk1UNZ5Zq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fcsc/iqX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fcsc/iqX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-723db2798caso1740772b3a.0
        for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269282; x=1732874082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=Fcsc/iqXb9G5wYPh6EA1ET9jqP7eUgN0zerS9Wg9Hn1sdUgpT+q73oiXOK6heMLfKk
         H7zlHyi1u6sbezyBkZFPGVAokp+lopCRcW7/MYrlsmP0KXlHz63BrCeZYknrVv4+uxAp
         ssoGQUJdDZESPWfGu2PznKN8UoqlttJC11hv9aIPm3qNlJAcI2r56Dy+eT2WQ7WOOHnp
         hUg6xUFayrm5A9RiZfH9oeKDKH3V7so7nNFduB61SI1GqJr77XKowZ78jkVbkxdjQE0b
         SMdExsvlU0t84lrLK8zyOR7VtxJ6MaKM/mLzjPhu9cj3T1UrFeOFxVUaPJsaI2uih5ez
         Zb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269282; x=1732874082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=EdRl8QvESaNGyY7TgmyDzCzxLTzQ/lhgwbNuq1qBjeHxqxF6k7c0BXwybnYVWra1xV
         3A7QubPAS1J8z1NDjVNDj4tf/HiuB/phSY95E8fRk7AdKt+Fncx1zuCvVQWbB88LBah8
         +gKg6r8LgG/LiOZlFjRQYCJIKPbf8Zue5ZEhFh0O9iRHXsFg5LMb7E1JzI/tzJAgs2Bh
         4Gf8MsSlCeaFYxW3oxb5qWDr/kR9lZy7Tdi+uBb+6Y+OTeL75qLRBXcdhE3XjsodPxcr
         NYL+okfqTDF+IPZJDCS0EFuQInkPMUtoWU1JUTc4o7e3W1ohuF0Pjtf1q630H984QVeA
         ZUQg==
X-Forwarded-Encrypted: i=1; AJvYcCUG/v+OHqaejLG3ynpfVHwR4q/jzsQSqSncAfI3wh6hSPqtFyzh34ObAOI2M05Z54Ee5TKzUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywovs7BlVHPY2Bx4YACkt1NH9djRlfuEonAWmpGdr8/Kq5tweJ9
	4iO1j0LOkb3TfJ0dwOFsS3sG45d8VOucxWeCy8ut573xF4ydNPx4CzQsDYS3
X-Gm-Gg: ASbGncu0KuiHgrpaVWViqfp+JcthvMRUa4B3GJJoSM67XnWUbxrM0LcRR7AKRmlMzPQ
	Bk1l1NLfctjRhryLcOI6RWnWNkkPNsc+22AxarVUQXmS5+R2hxWfuCCqwXThY2QDw8l0pC7xqGI
	AsQhUEEJ+JzEZOg9Ja+yOuojNCRQOyowmIi4oa8H7DbwfrLY8HeblbDHsSSB5A/3S/osOEy72pr
	lmi8URz9wtVOfSQ6NoqjwZiaQkobBHdzuasI/PEY3klXp07R+pgjdLOXRnNfQ3+pwA=
X-Google-Smtp-Source: AGHT+IG1mSXwA3TMBrA9RT10+LRaQrL46redGKLRvMQJTuaiKJytNKP6/Q6IsAaMKo5OeafMhXXAtg==
X-Received: by 2002:a05:6a00:98d:b0:721:19bc:4bf4 with SMTP id d2e1a72fcca58-724df696daemr2863138b3a.23.1732269282031;
        Fri, 22 Nov 2024 01:54:42 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Fri, 22 Nov 2024 17:50:31 +0800
Message-ID: <20241122095136.35046-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122095136.35046-1-towinchenmi@gmail.com>
References: <20241122095136.35046-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.0

