Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870F20F971
	for <asahi@lists.linux.dev>; Thu, 23 Jan 2025 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632295; cv=none; b=VKQtnjvrTO/B/I7MQaVZG9HwP2jXdKe34yjjpj+G0xcmJVvKHPGHNumBpKLNH2PvwdgcMLvToGa5QjYqzVj4svpyuNTnGJBkzUPm/mAyUWN5KSpDWFtb3uqMbXHhiaBpkqgct0lawD+n8VPf5jQCBRUGFUxN/xASyPOTRs2NdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632295; c=relaxed/simple;
	bh=/eaDwV7KTDWfsPyU+hktEZ7d7yXLBX2ep1Cpqy09s9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dsXx3yF6XZ1D1vV3ZKDjcQ2hDg2ThG6uSyJjeJTZsiU348uXZq1PYZvTuYl8zyuRob3/RsgylomL5NoS5ctWoPlpo5/mn5o17jcegCdr+AGerUBRB6zjvitLQky+cUMXrZ6Vj4HGPN/GUpkmU3+nEsm9TtDDxAu+LRwrgkwqkfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TlezAVee; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TlezAVee"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so1492158a91.2
        for <asahi@lists.linux.dev>; Thu, 23 Jan 2025 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632294; x=1738237094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kw2sM+GGGQCvi7C9fRiq4muvzn9J9eRfRdcwd5c9mE=;
        b=TlezAVeeJ3BluGqS4uZPnsDxfIH95oE5Hy/vsUZarfgRkY/q4aoV/2lv32MjOz2UHg
         XpaiA9BraVVyJXiKwBbMIOx4c8lY8E9rFieaF8WZ9nRn9QngLwt5dVkF8rnsh+1/qt4/
         DH+14mS/1j02z2ZedVhgtx0LU+XAicG5nqqHABDB3WMK/Vmj7Vunv3ce3lCC+9Gp8Ajq
         bWSleFvRBymedZpHE6897CO+4y9UxGDeTTueY8O/vNOJIJoHipBI+8lVVV2w2Ku1BCOM
         +/25jCZc3dX6SG5D7zKFVYa9DnWvAFh8OJbO7jicqvjWDmug2ajRbWzE/+wLX2xu6kfT
         OM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632294; x=1738237094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kw2sM+GGGQCvi7C9fRiq4muvzn9J9eRfRdcwd5c9mE=;
        b=MaOvH6YyzmQf309qQLeDDmPi/wMYKvOBeBUNnWlRSjDCS1dsIsB0jzHr2BC48ersgd
         q8zbjH16fK12qD72aoEiE+a/Kn2qBGHXzBDfDEXX1NDf+Qv2Ol1gaeApdfspd+tCuWX+
         YYr859VRYX5aLNYPNNpYg0cG3JG2HTdwMjV8WMlzCiBxIeJ6cOeHWLYrNWYdnkaTW1kv
         /V893PGbcCCPoiHuaCAMyZpe/qebtG6RwhAywbKE4PtHL0cw0tL1X4jvL2nIA1GEpFDR
         5yj0A1tnJGxTqsf6S0TgDH+jZYgDqqodTuVwKOCACVXiDrMRIrS35btyoKJ80xyRSqGe
         R4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV2SYPs5sMT4CDoxq8Xqm4iLVCCH6ub/ShK/01mBm16yAAWpwpcG3kW/fRZVJq5X4fc3fIXnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEo6zwxxugdi4exvsXd/cmexXacqs+MAGXOMQSDP/6E8txzAeC
	qCV8myN0E7NSs+qfeW+HVC8ZwGzGdOCE6w/U2ZXCQAGD0NqSOKUg2daw5KbFlI8=
X-Gm-Gg: ASbGncsDvEVQgN+gxLsmXS8gD8aFQlXcKqWAa2rHxznTKuPwJhaO7SWlr4q/Ne3ifqh
	Lp8onr0Posetgs8MQTIHEtE6D1TnEgrpBbpMALEQfc3+j0u2HnLfSc5dsUFJtApcq1S46UAL9ut
	7O7Tndqv+Vhid6vU9KLypkVtDGRtOfEMAna2rQ4BEA0LYpjrZvA8qefx+DDZ9gFpzN4KLyjoySx
	WTCQ6tZr0hSnnzviTunAzd9TQofWGYUpCkKQF22zjZPDH4OdbZeV9nbM9zceEg7tHgSPL72VXXn
	0Fiw3s0=
X-Google-Smtp-Source: AGHT+IHWLM3diQyfBwkugU/sw/GmrdkJCg0OZDXV8IndopAoO/pn5U57ZDPYAMTatmutRubStW8Kvw==
X-Received: by 2002:a05:6a00:10d4:b0:72d:8fa2:9999 with SMTP id d2e1a72fcca58-72dafa03124mr36163356b3a.11.1737632293795;
        Thu, 23 Jan 2025 03:38:13 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f06c3sm12714223b3a.20.2025.01.23.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:13 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/33] cpufreq: apple: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:40 +0530
Message-Id: <17e7f171a63d9104a0688d223539d36feead8790.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 269b18c62d04..6ff604a0fe79 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -229,12 +229,6 @@ static int apple_soc_cpufreq_find_cluster(struct cpufreq_policy *policy,
 	return 0;
 }
 
-static struct freq_attr *apple_soc_cpufreq_hw_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL, /* Filled in below if boost is enabled */
-	NULL,
-};
-
 static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int ret, i;
@@ -321,7 +315,6 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 		if (ret) {
 			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
 		} else {
-			apple_soc_cpufreq_hw_attr[1] = &cpufreq_freq_attr_scaling_boost_freqs;
 			apple_soc_cpufreq_driver.boost_enabled = true;
 		}
 	}
@@ -360,7 +353,6 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
 	.target_index	= apple_soc_cpufreq_set_target,
 	.fast_switch	= apple_soc_cpufreq_fast_switch,
 	.register_em	= cpufreq_register_em_with_opp,
-	.attr		= apple_soc_cpufreq_hw_attr,
 	.suspend	= cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514

