Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD442088B
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396766; cv=pass; b=X/BI/6BVq4X+X/a2v0PaJa9W/XQAbRi0CkxaKTt6X+qk6BWemnaIP/XpWcBwdXp2C6MfOjq16kbbdNMYgi3Ql0KIe3IUGLEd65nBpB6vYmKA5tYSa14HXhz7kA+YAQ8M6hr4hQuyFQpxCpvmZZCyLf8+lTbTqi8wLYTno8GByvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396766; c=relaxed/simple;
	bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSNKbJ2se0Z//AYFQnLanUxB47N9AFQ5xxigbSeRI/sHzMmE64pNl26d2EtU8eP5iwUWn52q8ea95CIRPUmqzpbqZ9yn3jLHrMAcpCSZf//L7+jo3wk1TYAWHeC6+nUUiUalfUyYMAf9U2TN3R7DH9ECvw3BFEY8YYgD9dr1eeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmgycP8X; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmgycP8X"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84347ad88edso5007610b3a.1
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 20:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783396764; cv=none;
        d=google.com; s=arc-20260327;
        b=SwMQ17TYmYFSrMMzkIcr+UQDrubzSSjJtTFoScFqldrrQ2T//Y5No/yqJbzKYPT706
         UOAfPk70JdFv+WZIo2v7mXWJ6Gh2D4oENrh6zqHnsl3OKovWmdGIACFR7f0TdDrKrWx6
         Rne+216js07z1ImZ95DR2SLkqLOGesAoZnxTji+QSPCCpTHIwPXc/5wUDpDPkoCBMd0Y
         waq9QKtZssz5UGtuA5vCc9qq2a0qkWE+ClnPpDnB96nc06do5neS1rqKOQwAf0mppWZG
         ztD8tDpbJ5TAatOcRvHUgC5cTh3K3pEMqULde9QRgD950XlNaA9K/KAiMWjZde1XfuvQ
         AKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        fh=zrN0pADXJvDnnELJbpqpV+Ssev15ixeIG6vyqugC3wc=;
        b=f8MHs1Muti6Uh7no2RG2/TY45iqKPYOJ0p07mqoLzBsA0J3LjNTmMGNN/WwB76E/CX
         E+35dGMUcCffDZnSK42qpxyeg9Cv5NQ5PfgZJ9sI7rC6tkxBh6bNyHTIIKKb2tMwHhek
         grYOgXZwgOG5KRMEGPRBINTmu5IVjT/gCe/8/WsMGfjoL5sgH1Cw2QDdbdb0Lj3EB5mx
         01qKfgxP2+iJgyF6OCNwNUseC5SJ9BExAMvXqACE06JD4RYpqw6vZsxykMuT/XPreFdR
         veDw7XhiAY9ru9j0HgLFB/d/1t8z68ow6BAZsCPhri4nS+ickSj0Q4xlX+LgrkJJNUnL
         Mp7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783396764; x=1784001564; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        b=jmgycP8XfkjrqOaxFxfYdBHPRluf8gHmHblb8fHWHbyHRcXfWNeS+ehlkmHCqCeeCO
         4GH9Vygm9U82c8TnvoHFEV2DAJ2TaOyYoC1vVKueVAYPXQorQ7cvHuiKTWYId17H2sqS
         NffyFTN2BHgNt7AadadZVWKEAIT5NqNrIKgvGG9i3QCJ5RN1XrhRximkfYSfvL9F4Mxo
         DpHv8Eq5m668ZadcDDZzMiRUyGJynjcV4JHMqn7mPvkmmIGhUG5WX86Qcz7gp/LpqtlZ
         aW2NRyYCyvVG2O+fNSUt/By2Mz2vJcZ6QL6BTKIo1MYhdvsY7lO9g4b0oyDklZbIX0ua
         9feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396764; x=1784001564;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        b=EFgeRKQ/xGJLQvFfNhcSvvAGKc1YLirrqzVGF1OiF5wURbiu1oTUj79YHHBWHsNeVF
         OUut2jMThjhbejEQQ5gvWkmS2V1Xg2JHwob6r3dCfELBiP26BHTiHTsc8J/54QH7gZZh
         We7ZrHViDqj/bv9u5U3c0a9lmD7//7F1debyI7VYj6LQjxLGd4LniZ91s+sQVVV0dljr
         IFexY/j1gGmlS7Z6t+PccZMzboHZViSzhEXAX3CiIxSkVx56tIMvk5z+fxFtn6zpWWR5
         R1k4P5cnHuU92gPQRCVFtKeK0UtdqHoeEp2orCqaQzmX+ovRu8lcakgZQRvPMiWaPclK
         Hz3w==
X-Forwarded-Encrypted: i=1; AHgh+RpmRj6nHqiiYyXVPxobdTCt8xUQhLiNgD49bxbIKjEli6UjJDVqltFAKyZNnsEPkJrUiRF18g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmk+xxPLLFdMKwu0dM0tMSdgxIuhgKbPKfo+Wnwbeck/HbBq6n
	2Up78uFWSe8NsfK0W5H7T8Q6KutkIqlGsn3u53krGUZ+slRHmYFy32X2HbNpsAVCjal8h1DKUWP
	Urc0hSyt8YsXaZS9cPZpKkBqE60L+BlY=
X-Gm-Gg: AfdE7clAPFDzeyKxf4gYRzNF40phamwe8anauxBwDmePfNEoAiurcLrDY4m5YFKFp44
	+nYsVr7xgRWG9dYNhKJ7C5XuHussV84hbzfPGyZ4oN+g8A0AO4KwPq0OOA2sKt/q2bUpjoHn4lJ
	Nd+gkAUwFekPjJUBZGRYFatm3uiT2EZqIpIiL97IdjI2epINRaOO/05bRBM/iRz6ZtWruBk+cse
	x/xTr9XXAHuWs7yvOx9gOcLt3YdA/yPdRkR9exGLOxvOdDOm3GADAEcZ/La+hsi1F+vBBo4IkpN
	xAZGMIH2nSWwjDyfNyQrvbH9YWUd8ZSuKOT6qQ==
X-Received: by 2002:a05:6a00:9098:b0:848:2f77:e2da with SMTP id
 d2e1a72fcca58-8482f77f285mr926489b3a.67.1783396764389; Mon, 06 Jul 2026
 20:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-16-phucduc.bui@gmail.com> <akurCIxgAE8DIaX1@opensource.cirrus.com>
In-Reply-To: <akurCIxgAE8DIaX1@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 10:59:11 +0700
X-Gm-Features: AVVi8Cdr5GH5D3WCL3jF5XnsYudncDmTeKJyjdqU4Gu_BSkC_ifMDT-rWPN5IPQ
Message-ID: <CAABR9nFpFR5JpU4BK_mc37sVzi9qF67Pp9y7Zqu0-uj+e44iyg@mail.gmail.com>
Subject: Re: [PATCH v2 15/24] ASoC: codecs: cs42l43: Use guard() and PM
 runtime scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thank you for your review!

>
> iret only really made sense with the goto, might as well drop
> the variable and return IRQ_NONE directly.

>
> Same in cs42l43_button_release().
>

I'll address your comments and send a v3.

Best regards,
Phuc
