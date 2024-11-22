Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6A51D86F1
	for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269280; cv=none; b=bzwKeLS9WR6MTvk99gyC1HkTMWfFJqftsNPB3PI+dzuO3N0sEHKFnFmx6vz3CIUbd7j2RihpxipQzy8LuRnox99sbE80EbhWiuOlImUvtrn+XzQRIMOM7jkuMJpNXN1TZm8wSFZHRdXsjv0dPg0k1Ap1UP4SWBL6i/A7MJn+/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269280; c=relaxed/simple;
	bh=XEarR1V/wSScu1ltyWhNi5l0HHJogogwRXsmiHTLBfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2ArbrAu5WrLt9szfSdG1u5AACaMOTbQ9iGuz4bwcRg5kJ53X9DqXdgM7vCn5VU5WiEaxnDyGzI5ZeTg3mbT07ZNDagShc7zFCD/Ml9seTaw3dxb74rvcjHNBaU3YNQQYzxIWU4FKikOMjx4zjjNmGLG2awdRTmCYCewxBGnvBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzJIPjMD; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzJIPjMD"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ee645cf763so1024844eaf.2
        for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269278; x=1732874078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=AzJIPjMDHMAKOMtcvJQPzbgHu7DHiDJDKDXqiuKGHuhCAGSE8WVBrcVvWop3WHs8pk
         SNmmfpyH6SLhxXuWPG09Uy1yAekXqvlq7tuP0n3+wmAKRqd5v+NdmHQjFR9u/V1Cz2Zq
         npJiq1GG8tcxEufCVGq6H2ZJiF+B9YhrVMT0SsOAJWjsznfeVrgjrQxr2pCKWzuMgEyy
         YVQw5xEEa6HPLul65N+MqGGxn8O1YMBQ3TpKOQGrrObVVikT+iEdfx0kPal2A2uPuKOi
         eM1UPmNrIWw7nq9pxcSW6VD7ZfnS68ok8pfKXgKJOlj0W+CocWk5TIv0YilY7t/6hMYf
         UeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269278; x=1732874078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=Xg33xz5sWgxMR5iRZ6/912x9CQNZHhl4CaRbHUBG99ulyfiQIgt4PT6I6HuJSC4J21
         YqN4i0vuaZPgXWj0OsHdwPpJ6ao2RO8z+x7x/Ymx7r4R0nADP5JUq/VNr6rb3o74J4kk
         1bKQgjMlGr/3BE3jJbbAUcIQF+ml2XmnZ5tmSGf19nxK6CJsL4BZTKqx7V+UNiMBvy/r
         UtW0eNHeG/OGCoz03TwJ5Xot1cD4YEjbOMLqakyavahfuo9qpg+F7pdGxSITrTBfVnAe
         oXcHXrrq+IbbDXW9zOiwu2wcSqvFuiEUwHyBBwAOna1Q+uglI3n7jlbc077jWC9F1UbA
         ggCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUIXAsIiUrxYPtCjQpnzdF0gk1xNi+3esi7w7RhYlbVpWkoCrkiFmc96xsP8fI2p4SOwC+yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrmT1hmnrpUd67XqPu7IfJZdL7/sHtF+v9C5Rees2QTS/UC/zP
	V/DsQlx2JQEsha3Tr/r+xbdbXYRmudObwNtFJONuBPFSPqua6Gbq
X-Gm-Gg: ASbGncsnmEjvilzfFwNtKIsMZOUVF3ihDhp2NSWqFH16Q9yocEcUuwlWX7Mv2MNAYnq
	0wglAkB9EGE63YNkNjNHWPs0hvzcQLmMAuSgmBL2wynZCf1AlIyiCyharwNPMp5JXlBrEjdzeAu
	TrC0ri6xIeU9n1kgZrodmLgucaasQT0Hv7U9Yxf0NlJX0rIgpxMwz/AUNMG+0ouQRTP2G2Xf6eS
	1qwFIhTOqlYq9+Hv2Dhgs84KKddJKeMrXKHRTzyjGAWXb/1GJrul+xFm2S14SjKptQ=
X-Google-Smtp-Source: AGHT+IE+gh3BSpZEe1CgwhnQPRowDufm7Rsfvh11La7niwtoGa5rKSayhi65ZAq/xM9Jk3gdgp3t1g==
X-Received: by 2002:a05:6358:7251:b0:1bc:59a1:5bb8 with SMTP id e5c5f4694b2df-1ca7970d006mr180191155d.6.1732269278502;
        Fri, 22 Nov 2024 01:54:38 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:38 -0800 (PST)
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
Subject: [PATCH v3 RESEND 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Fri, 22 Nov 2024 17:50:30 +0800
Message-ID: <20241122095136.35046-2-towinchenmi@gmail.com>
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
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.0

