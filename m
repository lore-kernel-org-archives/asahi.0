Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038383;
	b=NVpIZgOlNBfvVta8nJAWwxdLdtHU7bFqxT+l8sRdU+98lsnmZqaDQVGL4fSHKT+jTAyR
	 CqP59JfSzFm9YsF5BI7nldh28bfEi++fB8EGjSEE7MSqwT5cc0YmUpPl36Jg2W+kAvlfl
	 lZVdJdVmiNV+2yPfjrxTqbcjKu1Q/+e9RA9jVje74fV4PwYX7HuYiXXo8PX94noN6hEVu
	 CsDZ4yXdBd13dMWk138dvzxiAaN3aQYv3FhENtVUbuJKPaTStM/fkUN3JuH1iVJceB9us
	 fet7E0+Q7NBqq3/z3zjUyhDZzJUngxmJ6xL8b0IxzazT0rpOws3wXFfV8NuxBh07YLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038383;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=YVgg8kDI07SJ4vE8RPjDbnf1ZVWpYR1vOoJZ4UV0rB8=;
	b=WOpVMdjuWRg6TFZsyckJFi7MIi1FENeKwe8Jwb9H2GRBOGln27cv6LbICNUxBnf8Euq5
	 8zphdV7/YP6TzOYcNl6Ota7eg/nICZtk4dTAW7aIeG8yq3Wz9vsn78N5gmnDB5zvx0ceJ
	 KUHA4g/6yG0KM+rNValzAnZNVGg3okKrZzpKw1KfKXUxY20aOAjuQPTZ390Dfml9rOMF0
	 WQMxoTiZj+TKDMPH9QZ99WoKar7lIhAJhOzAK53WRGElQZlJnIWtD6JPHOCnL/5wZD6xX
	 Kp6ubj20MFLvD/o1CRCkRSc0VfcnPCacycKlwW2GkYy3RwfuJ+4azOJiPu404y2Ju3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZFyGRYB;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91B606A325
	for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 21:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E91B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZFyGRYB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795038383; x=1826574383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fmGCYydggi6/pw14GpOKh+8TnEMcL+rruKPQvLKl0ag=;
  b=nZFyGRYBgpGmFZSftTB6xiImDjZEsND3Mc59Pe5i5/k3HZc26gzW0xQW
   SpI5oBNitsvklq3isKXAr4riFaz/6COZc0kRGuL1tuaUS7vK6aBGAR5bU
   IyhgS8S4gk7AaEa+F2n1YqqFYV2IWksYc5QGpDB7k2D8Tr84KYvlLoF3z
   mKnN9Vg6NjpPoeY/3LPpBf10XGRG6AY4ZRbafEQxQP63SupRVat0DUWJj
   GlvKwkFVRSS0ocAke0P4788sMckfJZHXfnz8LPJL4sxLsMLwK89SM8l6a
   KCiE8J/fLWVT2qdN2fWzmDaQVoK0xG2LtE1p8jN7zZnLfyZDUkUvfsK7X
   A==;
X-CSE-ConnectionGUID: qOZCujoVTNuYx5tqzPXhpA==
X-CSE-MsgGUID: 8JxwDaxCS4SANnct4+xxhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3886668"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3886668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:23 -0800
X-CSE-ConnectionGUID: MNFJ9UuDSyaAj9EA3Tlfdg==
X-CSE-MsgGUID: Lk9NsYEZSqqjq4KYuuo95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10157286"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:20 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev
Subject: [PATCH v4 11/20] drm/adp: Include linux/bitfield.h
Date: Wed, 18 Nov 2026 23:45:08 +0200
Message-ID: <20261118214518.29317-12-ville.syrjala@linux.intel.com>
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

adp_drv.c uses FIELD_GET() but doesn't include linux/bitfield.h,
relying on an indirect include that isn't present on all
configurations. Include it explicitly so the driver can be built
with COMPILE_TEST=y on other architectures.

Cc: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/adp/adp_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index fdf0e6316175..21257612f5d0 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/bitfield.h>
 #include <linux/component.h>
 #include <linux/iopoll.h>
 #include <linux/of.h>
-- 
2.56.0

