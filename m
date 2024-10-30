Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230633398E
	for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730254268; cv=none; b=Of0OSyd14TzxWyijEDu3MV+34b+XFyQWV7PWk1zkdmO7oseLDfbYA+nQ3wpVV9w4+7qFTN1oYau8i0yAqXFc2YvnuV2dxhZ8kORZOpsb4LekRlr3HL9VvIGqmItAqkZj265j8AIh+3vCUvs1K1+1j3Ez4SYGTxE0RFhfRc6npG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730254268; c=relaxed/simple;
	bh=Tp7p9bw0nbn5UG+Dh4fqcVNN3VwcSQe5dBOAqyx1hmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D1KurzfKIsxqWuy5XRUX/Tph4cIdV6IMIB3+nJ8OWTVlsJpBYrgSlbXnWbLPejO/+LXDtK1FObMqniSzkNvPGfsg5LiEcmUwVGbw0MSxHFpsFnIju8hUQMpbuaX6L/vFjaLlnpNdaW48GFsyeqZcCC5lRyhUFkd8gcqBHSd62Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RjSFU1T2; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RjSFU1T2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730254256; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=df2OEQ9QZRRyJfgqE2G0UwgUL06fg4jkoq4ROUQvyDA=;
	b=RjSFU1T2G/wIK9aED3eh63a/J5KbU8goTqy0l31G2jTV8h4Bartmjako9WZ7dp6heBduTAOaDvzt1lUfbnJDTcBm5wzadDA0HjS1+cGRKjBKo5HN1iLSHuWQY8fzAB0WfKUTx6mStLEcjLw8N7SWXcpT+O1M8xndxCPzUDt4QFo=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WIC47VE_1730254248 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 30 Oct 2024 10:10:53 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: david.rhodes@cirrus.com
Cc: rf@opensource.cirrus.com,
	povik+lin@cutebit.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] ASoC: cs42l84: Remove unused including <linux/version.h>
Date: Wed, 30 Oct 2024 10:10:47 +0800
Message-Id: <20241030021047.70543-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./sound/soc/codecs/cs42l84.c: 15 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11570
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/cs42l84.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 47731cdc0e67..53a6cf6e445d 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -12,7 +12,6 @@
 #include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-- 
2.32.0.3.g01195cf9f

