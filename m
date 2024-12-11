Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B62210D3
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916188; cv=none; b=PCsM4ZlBqilCABB6ZIYQ0bwEe+ktiGK0d0mTmtGyxvHAdnSAE7TiLVcKkba4MWqZrsIm2Lxc5NT8CPBONlEapOXCM8PizvNItaBTuCtO8IuQAQfPODpPefw8nbJ91SpH0QYOzD32fe45t/H3dplgJqBrGZslienqqoVc0LRmosA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916188; c=relaxed/simple;
	bh=Z0UJoK+JMHqXLXGpFMKhOQr6LnXF7afe9z5eb1Hv2yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJadUz0BT6bDk43mvT8VwPsq+VHBxHb9LzIUBfU5VSBKDzO3cyBw7VptoVo+rQXrx2ZoDAd9Y8rQFEB+uir1RlKNPV3BUxVIOMXRUJum82bflBRszqkTOjf3pKJDhrZB+UbIisqPoyC2E2opIMOBKAe/zJ98LmM9A//+iFIbEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrspB5Gl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrspB5Gl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216634dd574so19626205ad.2
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916187; x=1734520987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=BrspB5GletkwU4oe/qKTXjYJEH6Eh6njFMVE3pgRvNjHOC5hsxJ9SURCMS17gsHvNw
         cmk6xfIaBGHVrPfK2v0a/14yy5JEB82amvxKjlkiHkk/2/l1s0JHL1wUA370A0O3/z61
         PAQqwfWmE5fDKKWNjLMT2NymHAXkem/9ix5lVFiNNa5XMrXtm2+Wyf3SAeeA6NbmGqOa
         1yI11geTbd01kwIDfQ0hIbcaTT0KXmCKIes16snzO0F9ZPgmqKYIGvUNsc/hwx+kwl+R
         RwaS0UVbaqZXzKGntwoHhko0W1ZTeOh75acka+ByL0YxKya6vWFQSiYD360igVP/4xXr
         fURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916187; x=1734520987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=G5kXmjyli7Fo33tsBKZnU9JgfNakgIkeXoarqAq2u3+rWW/ypurKcXJclemU1BTpp/
         pOBHlhbpZ/U5IVDu99qcUf3FMRPBhbRMaVh4StQNrVTGl5kMz69xbAUoqBwVLPPTXonF
         TS0qjgHatXy5QNIqk8zchz4ZlhXNWTuq8m0pxd6d1ZsXCAlMqUJFV7vG8/40G5kye97d
         xfr0uzonnOCV0FE764JCCmNoj6R3P/O6UCHcPTPHQ05Maf/SdguP7Rpa4d0HS4KkuUjl
         S0KwN+KiCUSKKwFZ/UK4l16xBRS7tK0UPDnpJeeHG0Ng2F1hKOIOxmvcB9kyPVGYJCxQ
         H+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWTlmnhbgOQYkVXyqqlD+XcBSjv/zDTFDoT9+DneSD1glUBIWUyWKcyDjMfzRnbWkhMQ2j1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBMtg4ys3jxGqZi2C8vWbjITFoTETZXxrvRwyCqVlJ0WUNi0/X
	5b7RLQE11s0GBlsl93kxz4S7LscZnI9cHcdU9FfiieLmhpdiZH1A
X-Gm-Gg: ASbGncsOZ9/0zxoTo401fqHN3Y8kWX9+oCqetwx9uChUI0A+LUAGZmA6O5WMea/G5Va
	JZFDMeE+BVMx2iBtP+7agFVYTVG7WgYFA6j7BLA70/sdA9CwtLZAA+Fl81cF5p9/vtfuAj8+SAd
	wjbEHQ4157FDTjAwoVrLEi0IKOZMON+Le52CQapZY30ilds9QCUqC9BJ6yW76NXoiy0fsWRZV59
	cLrEF1ySNTwZQy5CqMSBPerhYSjXGopNpzdANUQiRQ56wh0AJMWFGFid8hmlxxSjvPHdA==
X-Google-Smtp-Source: AGHT+IFM5a7MpO8fzMF1Ciyph8SCkj9YYHpvyC3PVX6ufLbwk3i7/23nnaT70/hHri50A8+ULdGjzQ==
X-Received: by 2002:a17:902:db08:b0:216:2f7f:ff69 with SMTP id d9443c01a7336-21778393b9dmr38658675ad.5.1733916186646;
        Wed, 11 Dec 2024 03:23:06 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2 compatibles
Date: Wed, 11 Dec 2024 19:19:28 +0800
Message-ID: <20241211112244.18393-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for Apple A7-A11, T2 SoCs.

Apple A7, A8, A8X gets the per-SoC compatible and the A7
"apple,s5l8960x-cluster-cpufreq" compatible.

Apple A9, A9X, A10, A10X, T2, A11 gets the per-SoC compatible, M1
"apple,t8103-cluster-cpufreq" compatible, then the
"apple,cluster-cpufreq" fallback compatible.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/cpufreq/apple,cluster-cpufreq.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..896276b8c6bb 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,9 +24,17 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,s8000-cluster-cpufreq
+              - apple,t8010-cluster-cpufreq
+              - apple,t8015-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
+      - items:
+          - const: apple,t7000-cluster-cpufreq
+          - const: apple,s5l8960x-cluster-cpufreq
+      - const: apple,s5l8960x-cluster-cpufreq
 
   reg:
     maxItems: 1
-- 
2.47.1

