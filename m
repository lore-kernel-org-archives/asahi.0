Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453556FB0
	for <asahi@lists.linux.dev>; Sun, 12 Jan 2025 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736713633; cv=none; b=JvwOfA92VfF04nOISisMQDk+w940WdI2pTG9tHpvMGJsj0pkZlpjxmh1jMSWqCp2ayB3JjNjmtx+oojoGawbKJl0x/YgbFTz/doOYrIK9+ySf1+Zr5Xwube6QGRmxf0HNSMABOuWDHmQ2m7mcQAOfanrmOjY1urzlI6I1n8CJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736713633; c=relaxed/simple;
	bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdJDdpLubz4oUUdJbboShDCzNmjW51KdfGWwLZLkepkGduVNYTSE+94YKq5nStD+cMczUeLu6aprsPc+/oWjG2UrqSJ1E/PEAl+3yzVhuv+KnPMEj/OMwzpufJ+BAzwqa8roO+KbWcRowRzl83J7+jKoGmp8E6zJBZeBJmhJYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB2pWrQm; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB2pWrQm"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e54bd61e793so6157931276.2
        for <asahi@lists.linux.dev>; Sun, 12 Jan 2025 12:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736713631; x=1737318431; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
        b=EB2pWrQmwNALT8QZmJFX70isOsUJ/fcN/D+K1vnpG8rYP6qFydgN6TlJkJltpSI2mx
         BRz+n8+BrtmufiSJnz6hFWYJyymLXHZmEnwdNVRouUMtpLVuQpP3JQ6UMvxPHBb5gC0l
         AxsyJhRFhrAGldye/FmH8YNhnvK2T3TO0X5h5fQrIwSP3MhftxVnOudNb7uFFiOs2/ok
         Lhie+Adg05n1ZQ0hn23ETKI1khIm4BvnMcoBvevU+dTuY3WzaAXYcn9+z7xwAqYbSmjL
         oFjTod/CtjpeYwLGSJk0AmouC0bBRd74+l+INbXhxpZNONXWdCTi7SJgaU7NH22KRsEb
         g2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736713631; x=1737318431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
        b=jiSBP45RBGjPn2erT7XN1QAPYWahi52aJomFJOpkDKgWAXcMhTTKeE/+l0cQSDHY/e
         CB84JKojmWqgCTrzjGHSGKj8ZTWJyYTp3+7vEKTv7bmt4bvo7FgJxTdoHFoL+28l1Zqb
         292PT3cWijKcsogHpH/GRAYetDjhUuiB1zaNUPITDiRdSLtZXFBvY4Vo0+ENPrEVqe1Z
         lggvAu7DEURtQ+/Rnh4NvV260HloBwiAo0XkHqt62+fjEKM42fcKuy7OyfkrBnivXljA
         cCStGWz5sVuNhT+zbR33J+hluVdn6vPfeSQ9YZR2sWI3gUD2cdoTv208oNVnyRQ+X1NP
         xUNA==
X-Forwarded-Encrypted: i=1; AJvYcCVB1TRpBenYH7Usycgf2yWoZa0J3CJcToz79wuX6A347eMaigJArTy/TJknVkdQxsRYuJa6Mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7IX32G7RSaLA7Pd+Ez6yZgyXjoodk6jGFME0b/+ER0zzGZ7VA
	K4LL+Aizw82F6Yf9vInpYybeF5budYIxE8JU5bFB0SMNlVFM3sWxs0BxBrbAhgigvuNBIz6s9s8
	k7EnjUWSG3JZ75zLK5eBnRKNvCmQ=
X-Gm-Gg: ASbGncunJ6tHJGyJiWYS2aC+R9EbJ+Hr75wSkOrdj4jdRIOsWVZRZkmQS3RCpVX+WgA
	7ArMdIDLX5VqVglArBVBHgCxUkaXwygH6YMggJWs=
X-Google-Smtp-Source: AGHT+IGZaC/OlbRbsNvYaMYjxRBnL+2yYyfV0AIbRIBDdrnHp3fqv3tpczf0rasT8ptHihHYsOZGlHD6v1QG5rnyZfw=
X-Received: by 2002:a05:690c:c8c:b0:6f1:5591:2c6a with SMTP id
 00721157ae682-6f5311ef109mr147703997b3.3.1736713631265; Sun, 12 Jan 2025
 12:27:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
 <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com> <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
In-Reply-To: <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 12 Jan 2025 21:27:00 +0100
X-Gm-Features: AbW1kvY_ntIDfWPnmKQupEStaGCx1YY-X1bjoh686czSMiCWmY8vjsKf9KrYKtY
Message-ID: <CAMT+MTTOeyAKUDYYwN+hO_QVBhPK4w7cktx5LQyrxrfDTq-wcw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Nov 2024 at 12:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> Please add BL_CORE_SUSPENDRESUME option to the backlight device.
> But interestingly enough, none of the panels set that flag.

It appears that setting that option re-orders something in the resume process
in such a way that the entire display locks up and becomes unusable until
the machine is rebooted. I will be sending v3 without this change.
