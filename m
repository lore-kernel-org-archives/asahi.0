Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C314A4FB
	for <asahi@lists.linux.dev>; Fri,  4 Oct 2024 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034921; cv=none; b=eAbT81qQMr9MVEQfaAwoImzKLr9OzP2oPiJXpFm4yOZIrk9mSHalNUEx6XJffcJFivYEphvPYpbe5DUNZvphFqHGQLjNzaGV1kXiQGrTrgmwDsSwgqWjier83RDPe5Pld5r4lg2v2s9MFhzCyy6jZf3sYy5mKjLTzgQNDnCIIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034921; c=relaxed/simple;
	bh=xRPuNhPsiXGT6a+lO+CZ7Sg6JO8cPSOCVaHEShpIFqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYBDyTUT68yXD81uKYkjSw5jRxGRwKAYI7zj5gmqBjWGQU9cEZrEUOg+Znl6aRcg7EKzeZ3V+mg+tok9KbuqXXDikZGsjbvnQunSefXwJAazACbIFPFz3hXOR1/FHYbeHEI/0D0djkx+d9pj1t70nKZTAGsfxBOtQ8sLsvtJYBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWz+ZMx7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWz+ZMx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034920; x=1759570920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xRPuNhPsiXGT6a+lO+CZ7Sg6JO8cPSOCVaHEShpIFqQ=;
  b=JWz+ZMx7DdW2qvFaj/5cq58tHZRhKrmmLjWljFhxWmK2iPuBMcUJldSd
   94s41kNjZo4moUyBFWGmQTSq1Xq93euURLY3rkCoOPfWmVrbutXEAojK/
   kryYrvYmDwKjO3ptUZLdgHqZSZrW/ICdLGfcDeBx49BP9ACLCytXPSDvr
   RRZ/79OYH1MMy2ZDNFVDxtdlilnlE+iUvasB7SsS6dUv4WDEhMgR1rQaC
   h8JUxBUMnpI3in1nHL1e/vt2MsU1mYa/HrCJRlPdfmVZYLKT0uPjbvPJ0
   MExYCFlPzXaKyiQcWQl/z+/D0hDX+ie9fDsA/CNIrgwtm4Wr0v6dFdZhY
   A==;
X-CSE-ConnectionGUID: 0CV/bzC9S2GccH9biiBlgw==
X-CSE-MsgGUID: 7osNhtpxQ7yLyIlciSDuIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136233"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:59 -0700
X-CSE-ConnectionGUID: Emg5aJ6gRK6Z5Lv5YMcOjg==
X-CSE-MsgGUID: /gdpKu12TpGmH0AyePnrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492123"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C9F3811FA28;
	Fri,  4 Oct 2024 12:41:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweot-000TiS-2c;
	Fri, 04 Oct 2024 12:41:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 51/51] soc: apple: mailbox: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:55 +0300
Message-Id: <20241004094155.114218-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/soc/apple/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
index 49a0955e82d6..30fefafa9c59 100644
--- a/drivers/soc/apple/mailbox.c
+++ b/drivers/soc/apple/mailbox.c
@@ -276,7 +276,7 @@ void apple_mbox_stop(struct apple_mbox *mbox)
 	mbox->active = false;
 	disable_irq(mbox->irq_recv_not_empty);
 	pm_runtime_mark_last_busy(mbox->dev);
-	pm_runtime_put_autosuspend(mbox->dev);
+	__pm_runtime_put_autosuspend(mbox->dev);
 }
 EXPORT_SYMBOL(apple_mbox_stop);
 
-- 
2.39.5

