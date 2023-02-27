Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0981FBD
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 10:07:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id e37so3094367wri.10
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqNgqAJx/n0S7+BoW8AS5oVR4jMes+tqXU99MEBiNwI=;
        b=E1ROgjIM1XNegAMpfrYyY9kkIvGBVnqPPjdVsHT4VHjei6/6FcJ6ycWizoOrBesIdF
         jtc4IG/+Nrwgwi/sw0Wyss7OYRGBhwWS3KmJcblbx0KtADk7dXpVnxBGnvWUWondngo1
         iNxNVC9kRih5IbgqIghKKdZBdB26NPToRhvuVKhE2UoXMtTUbVEB1Nya9wwNrGF899w9
         fOkWG2o7KM1SYCn2yRijDfrqiX1n55TiqvPJ1wVUj5DOAtSp5opGadsbDccFknndUJoL
         rqxZ1VnLUDHi9pfp1dDdHY+E74ehBrxaere1HDL+zzvfgiHU8DjCkPlesbq6VqhMI1wH
         mvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqNgqAJx/n0S7+BoW8AS5oVR4jMes+tqXU99MEBiNwI=;
        b=6kUd1y6RNEBaY08secluUjA1lEMBdLZ58Ec9vMbKWQwLCkSgRyl86WuXGIF++qJT09
         mlSU4ODg/wg7WLna9UbPROkgDlTQzAxKAXrjJvbQbcEK+uD6k+j7aj2l8Iiu8h6iveXb
         R+9lWLdiwPSnjtH7go8nOSZkpIWuvP8bNltZdVarB9XmBdz9lkot9cWADCGbIGMR339d
         3Wo3nlitEWRndogg7l99OMDGuBYkvpiaAWR6i9tUwqIslx0S0CgLUi8GuWTozUEhbh0C
         SCwj+E26UMmopGYIG2g+4578rrCUKGqHacD5jisTprfDqbRm0OdlKTcKpeBFN8B9WiwW
         5K4A==
X-Gm-Message-State: AO0yUKVMhYa76PScxPOmCdYMOZBe15UyfedHgKvjXJWKP8qmdJWXGZiz
	KuVahXqrP8Vredf360LnJvE=
X-Google-Smtp-Source: AK7set9olwW5SckjSIZrQELzNrVlnXDXFuOGW2+7Md6ZiEesbCdx5GrGgnDZEgw7EmgSd1m2Tc88XA==
X-Received: by 2002:adf:ee8f:0:b0:2c7:ffd:f483 with SMTP id b15-20020adfee8f000000b002c70ffdf483mr12018660wro.41.1677492433585;
        Mon, 27 Feb 2023 02:07:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b002c794495f6fsm6475314wrx.117.2023.02.27.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:07:13 -0800 (PST)
Date: Mon, 27 Feb 2023 13:07:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
	linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cpufreq: apple-soc: Fix an IS_ERR() vs NULL check
Message-ID: <Y/yAzR6sWvPedLej@kili>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The of_iomap() function returns NULL if it fails.  It never returns
error pointers.  Fix the check accordingly.

Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index c11d22fd84c3..021f423705e1 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -189,8 +189,8 @@ static int apple_soc_cpufreq_find_cluster(struct cpufreq_policy *policy,
 	*info = match->data;
 
 	*reg_base = of_iomap(args.np, 0);
-	if (IS_ERR(*reg_base))
-		return PTR_ERR(*reg_base);
+	if (!*reg_base)
+		return -ENOMEM;
 
 	return 0;
 }
-- 
2.39.1

