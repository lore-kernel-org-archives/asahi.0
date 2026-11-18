Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038388;
	b=QEhBVX4gn27wpa1hnN3IGkBovDvMj/D1JKuPQnOvbCpNHxBZI5iFNXTklE7xZuMtNtM+
	 vC4J/usxiiUUcY0NVaUlq4wvUlF0sNufT8mKcxN1BbOCQ8Zk7n6H4U+gp+afDhwi58taz
	 6B8F+9CGFMghBAzXZzvIrFCc7yntO68m94SCX5ERtX67qrXk1iiUf1zzyY0PUgaLfaDlq
	 JcsZ49vpnj/P/BUfZulsSDTqp95MHyhjS62kHjXs1vg7VeEyzFwb9nScIAo4T26Bs0E8g
	 cNoGuUlyZb4DY70seGVshRrNdOAXiSo4q1/y2NbvRGmutbMLENPbMYNuuq3jMcwRvvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038388;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=Y0LBTRoIrSbC5Sfll+sGVAP5+OjOCaUvoW8zHiNYncA=;
	b=ecqVKbhNQrptTltYTc7OAbZl/Wbr//o4v6WBUa737U4j+wuj8I1O/h4SofLeTqsc1FPN
	 aEiCXlsXDC1odSJcUw+c1PLi4tblidXdvZZPqhhFic0WCuqHDX/hQHASV1MaQcExGkUo1
	 FWJq7SD7PTxuENDMfiSAJMhab+lUIplJlZ3VYABKBU6vRCWv1mQdeqCdiGdfBU6JxCbqR
	 FPIOGekGyh8Vat3rawvtNlNnH0L2+f0E/TsUNHXdpsAri5xquNoGaEb59On8aQIJospj3
	 YTmIhjLrRFAxsOjXn294+1sT8GTXWSrisjd0fjRyWhg2W0t9qHMr7n+GN5a+0rtssig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ThBsci/q";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F2606A325
	for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 21:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98F2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ThBsci/q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795038388; x=1826574388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=85MO5QHDvAciZphg0emjzSvADqfM1RF3tb6K8saGXJA=;
  b=ThBsci/q75f9XEVLQ+CXEl6b7rYbwZBxuUQEeWOebUajcTp7aExtOlDx
   DyCWWqSpU0kI8UFvm2QwtUEI787VRqPNdRuA8mQ523a79+Qm9C0axrA+X
   413cH/In6JLnDVvaEPmBeZR2/me15auqngAzlPhHGgS9TpFB4ga+iT/sV
   ENLE4oLBUNA0YvzeSKH2z1CVZCw6K3Pld/wPwrIXT36NmPpe/WT1L6Spd
   tlJNtGiKJ5tWn46fXLVX/3jGdz4/3CiuHUnd5E0F74Tb7/SfEtgG1257o
   b3FwNd4T956ku3cBDywTXOTavgJTXza7OyZjJ4QDWM//PTuoUVadwfQc5
   Q==;
X-CSE-ConnectionGUID: sc5gjU3HRm6V919zNulZFw==
X-CSE-MsgGUID: kbyaf0GgRJCIVMpM0ugC3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3886674"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3886674"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:28 -0800
X-CSE-ConnectionGUID: 9Xvmue9aSrCRleNq7yjZ/Q==
X-CSE-MsgGUID: gRy+kUZkQDuaGA2b5jc2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10157289"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:26 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev
Subject: [PATCH v4 12/20] drm/adp: Allow build with COMPILE_TEST=y
Date: Wed, 18 Nov 2026 23:45:09 +0200
Message-ID: <20261118214518.29317-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow adp to be built with COMPILE_TEST=y for greater coverage. Builds
fine on x86, x86_64, arm and arm64 at least.

Cc: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/adp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/adp/Kconfig b/drivers/gpu/drm/adp/Kconfig
index acfa21ee06d2..6073aa6b46a4 100644
--- a/drivers/gpu/drm/adp/Kconfig
+++ b/drivers/gpu/drm/adp/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR MIT
 config DRM_ADP
 	tristate "DRM Support for pre-DCP Apple display controllers"
-	depends on DRM && OF && ARM64
+	depends on DRM && OF && (ARM64 || COMPILE_TEST)
 	depends on ARCH_APPLE || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_BRIDGE_CONNECTOR
-- 
2.56.0

