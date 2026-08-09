Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DF263F34
	for <asahi@lists.linux.dev>; Sun,  9 Aug 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786287625; cv=none; b=smrnxikQjLMFWNnZnfkeNmQVitZstPgX15EnKC2j9L6I3SKRrwiAZXofmYgUw+DKLH93cKbvGEbPHuJzdu9Nl4vMz4jQEbgkI5wqG58AGV/8rHQHCPdKH3yfO5tNKVgw/6gt2SwKhd+cJamq1Od9WmOt+/rjBtZH2CRip8sRLm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786287625; c=relaxed/simple;
	bh=++2CDr8sslAi9FkAF5CJbSrtCQTx4S/16bfjERCe4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACfy1+VFKOIfBNw4gcVMV3qddFSTQOicYAreqVf6HpvyUGNe455Vx/E9SThardaGR1L6cJSKekbmpAfcz3DPir4d1ABME74y1rtqtUg7S4NdNSTPpNRBtY41Q+8+a/O5Y0Xil79USv+bB1SGDBFHQrcywUw45QmU8h1Xh/z8u1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5lKbqyE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5lKbqyE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so825058a12.1
        for <asahi@lists.linux.dev>; Sun, 09 Aug 2026 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287620; x=1786892420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=;
        b=o5lKbqyEfAOJZogHj0WqF25e94IEskth5vYL5So8ijwzx/kugsc7oUO/1mwKdruAx1
         Meo877Fs82Id4v4BNRbyyQn9nJMO+i+nhvAAufq9/rW7NnsfJuAiIl/CzXp+DMtV7zva
         jrHct0wAOtrhTxJjc4m67KqgzWbJChU1ijCnFA4jm9dwf4IE5lE4a7pWUzqn9/hkH52w
         EM+qlMfYbDteXce0QoF3nD/6LQeyB1UKTtx55Gq/xKUrBwtYIXmolCDAIjVBu/fTwLPn
         GR1Qlqap7ysry7hyULV4SN2TLoIER0NDvUWlO1DFFQEaCFRlGw6/+j1QtWYL9xJ7IFO+
         UNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287620; x=1786892420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=;
        b=k01d2/LAeMCHrJXsDQMR95RL+OYu7uWSqEjcl3Lgs8u+hjwgUoOu0qdysNLKGNppsM
         VdfoZKPihtYr9SRaXo8Uocq/asI0AKXTGv5XoDlyDK5XcaHrWBdCLeclb35RVyu4efV1
         irpLKRwOlP7LDspmegF98NxNibq0foUVhAwjfPaHS90FKznRzjEkkYTQRFUXvG9w9wkz
         03Yyu3KS4m1kNdwcvwl5DA8Gx2Ser3DCH5/IXIYUpKCBX/5/Etc68WaZuaaUizrsR35t
         3/n/OaAbrkojCJ4QFof9YDHO1vmBbkPUzjRX2o3yLSNEKnzXrCHsUuJti/4mrhKBjIfj
         DrVw==
X-Forwarded-Encrypted: i=1; AHgh+RolKEmVqp/kwnJNX6BRr4doXrDpS1pPtl1ROiiI8Zwi6NiObyn0oBT4HEM6f0geEHO1+PNdKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8y95l8ERwVLHkJyVCxg+JLPajaaZRnj8RLaDfmrgFkQU68bzI
	Ade5pGQBC9pHyEa73NrxJ7e6fhDeSudNcbmokAd9KB+dOGeth+ga19jq
X-Gm-Gg: AR+sD10pEtjn5+znC3s+nesmApF42le9wld2kM1lWA4bY2XrS9FKHeVHoOHeYLkDWH/
	NNaxSVQZtH6L1jKRws2+DQUJZldTEWkkc2mOcSVu3KHaJZmLL4Nt2vPR8JwZNvRiYGN6qmWreu9
	gho8QZ1JuxOjjD4LnBHcrC1j1SG7Gtzyga+6n50gb9zxQWW7bD8INM2S34gjgVdQOPBjFr728Im
	KWtFZYIM1npRRe4LcVf28YuXoJK3OaDyl8X2xq3hg7liMeuxXLkMlv5qQjIAQbtaG20uGGneGyx
	you93GinzhXqcHQOKpy5/zv5DplSypw9wNxe14xmfwpZb7RtV0SWXrJroRDmubKdvekabPa+k5g
	21okzrsKuwc/jGziEFaMKu6hlb1vuAjiL1bJ/JvjK0ROK3Xv1kzmb17E37mhA6xcJ1jfF03lggY
	EPeKoq/SEy/NfVp10Qp/mpbkiQwWpyqe3nga4lc5ihcWX2XHYmBQ9ZGQtunrvDQgX3hbUZ+4h6h
	c108ohDGEagEg==
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3cb85e2b463mr38599908637.11.1786287620225;
        Sun, 09 Aug 2026 08:00:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm26361846c88.14.2026.08.09.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:00:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 08:00:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Constify some structures
Message-ID: <50bec487-2900-47df-b9ae-0ff13791f4de@roeck-us.net>
References: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>

On Sun, Aug 09, 2026 at 03:49:10PM +0200, Christophe JAILLET wrote:
> 'struct watchdog_ops' and 'struct watchdog_info' are not modified in this
> driver.
> 
> Constifying these structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7319	   1768	      0	   9087	   237f	drivers/watchdog/apple_wdt.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    7543	   1544	      0	   9087	   237f	drivers/watchdog/apple_wdt.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter
