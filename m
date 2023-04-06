Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1492320D
	for <asahi@lists.linux.dev>; Thu,  6 Apr 2023 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680806647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KuWqlFWscCHky7PklpK8/27+L+0fHpmQONWaBu1fu8I=;
	b=NdkoF3ycB6oGqkb8DFctBc/BSVYIk14/yhVBLlz4/mcdaLCrJHYq4s8CXglxKYl/9S8DA9
	MKt3DbanqbZCIweQqF/43W+p2B6ugm6g18WaHPSQeMtKOKzFpA+Itc0567DdYxkZhpkg7i
	tf7Nd9UsDFBMEAZUWbGzsVOJB2ORk7I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-Ib0EkVZGPfOmNzVjgRgwVw-1; Thu, 06 Apr 2023 14:44:06 -0400
X-MC-Unique: Ib0EkVZGPfOmNzVjgRgwVw-1
Received: by mail-qk1-f199.google.com with SMTP id 72-20020a37044b000000b0074694114c09so18018029qke.4
        for <asahi@lists.linux.dev>; Thu, 06 Apr 2023 11:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680806646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuWqlFWscCHky7PklpK8/27+L+0fHpmQONWaBu1fu8I=;
        b=KE7G6XZh/qGps3/8Tj/vcpZ+EuZCkQwrwdcmRMfpsBYLO9V4HhOfqCEexxydibGK8y
         shX89j7FvnQ7JiMJEkS7d+W8M/hP570L9TYpxjTJl3+wOukpUiX1H7iS+NM/pLsAire7
         FhxhVPsZ2sj2b52AsrfwlT//WdwUCD3UkifQQQmvFIcD3psV5QadsFFgf53fW4hN1dRB
         fperRq95/d4X8uUEs7K5qKWB5wDdw2qsiBrGs5aL0g/shxyCuNaeL7oB5AJfJ7zf51Zg
         pegLpGenGWxKh4zazj1aiK3D3sC27oq93ZhSWnm5QlyvBrLFDVfA9jpS3MYu9LDI1WFo
         kpPw==
X-Gm-Message-State: AAQBX9dF+rrpsMoeLvFO2lvwI1Vx3d8BWtvtdVUYg3cYFtSk7UlGgqTl
	oJSzPRucGflVKjr2gyqYyKJk0rgRatELlho199jk0NzJk/gBUlrrldXRRZXnFtjxi5nR7VM2uju
	jc3OcP33usNILsMg=
X-Received: by 2002:a05:6214:e43:b0:56f:728:19d4 with SMTP id o3-20020a0562140e4300b0056f072819d4mr395408qvc.26.1680806645964;
        Thu, 06 Apr 2023 11:44:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350b2ByVQmJQEcdujhQzaXx6wnS67JdUovCAIB/18ORCzUQZUmTu9kF7vDna0IuEg2GJV05SvOw==
X-Received: by 2002:a05:6214:e43:b0:56f:728:19d4 with SMTP id o3-20020a0562140e4300b0056f072819d4mr395378qvc.26.1680806645607;
        Thu, 06 Apr 2023 11:44:05 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c79-20020ae9ed52000000b0074411b03972sm668481qkg.51.2023.04.06.11.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 11:44:05 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	p.zabel@pengutronix.de
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] soc: apple: apple-pmgr-pwrstate: set varaiable apple_pmgr_reset_ops storage-class-specifier to static
Date: Thu,  6 Apr 2023 14:44:02 -0400
Message-Id: <20230406184402.1956429-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

smatch reports
drivers/soc/apple/apple-pmgr-pwrstate.c:180:32: warning: symbol
  'apple_pmgr_reset_ops' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/apple/apple-pmgr-pwrstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/apple-pmgr-pwrstate.c b/drivers/soc/apple/apple-pmgr-pwrstate.c
index a3e2bc1d2686..e456f6e04658 100644
--- a/drivers/soc/apple/apple-pmgr-pwrstate.c
+++ b/drivers/soc/apple/apple-pmgr-pwrstate.c
@@ -177,7 +177,7 @@ static int apple_pmgr_reset_status(struct reset_controller_dev *rcdev, unsigned
 	return !!(reg & APPLE_PMGR_RESET);
 }
 
-const struct reset_control_ops apple_pmgr_reset_ops = {
+static const struct reset_control_ops apple_pmgr_reset_ops = {
 	.assert		= apple_pmgr_reset_assert,
 	.deassert	= apple_pmgr_reset_deassert,
 	.reset		= apple_pmgr_reset_reset,
-- 
2.27.0

