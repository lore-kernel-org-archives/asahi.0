Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC90D287
	for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5LjRDC/"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e759ece35so726025e87.3
        for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 11:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703446152; x=1704050952; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tPKMTQPdvuHMZGXcGgR4PK3puQk6VQckI2AGeYN+ECc=;
        b=c5LjRDC/jF8MhsD+FTFxhKDXZKrK5ATFQbRSPa/0A7BRO5o3mCPxVrs5hrdH7Pxevq
         KwN54r+P8E6HHFDUUa6MMp9vN+idXW3/RO3rwI7Pn60J0rLFo7i9+3rclOtFndOEiObm
         u8ICuATyuCsOgGr9MC32Xb3kNhgd8rEgP/WJHo94RoU0tVanPFcoKiS4souCNlL2lR+2
         SVk+GG8LR7yWtXRqJyzaSC79w//KBFRLqYwzNGzmc4I9goc9Aq64NBuLBCPX1aR5rgU5
         culyzYdhLVzjFMK/lCI5y+Xp0NSLDBPCT+pRBv7bBZnEjfVJlLI7nxH3Wym4aqD4exh2
         baOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703446152; x=1704050952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPKMTQPdvuHMZGXcGgR4PK3puQk6VQckI2AGeYN+ECc=;
        b=w7DPJpCofd+cKR9qN6Y2avePlOFfdGDiQytdx8jnH8zW2DrWLxMUFoACu4FGlCpKT7
         yeezxjmuIeWswapXwoWWKxSfDkV5lkj+Rj59WTGCNUJTKBjCXi0keAy2u+G2hBPNZFOR
         PfbSag30AfKAW5Ad46lnh5k4163xiRO7ywtNNNOH81CNbn8nk9y1r6tZBErKg00vdNzr
         R7/nGzicT0O0xbx5M4c0psOkg/SQn0kDJFB+Rw5WP2P6u66i+trBlhqljOfDCSw0ldW7
         JdKf+Q3mxJCHfToBckgZThATOuCi0CJrkmePCAzmhYc5rvK9OEquBD2bYwP368nJ1aKT
         MEzg==
X-Gm-Message-State: AOJu0YyT1yFlO6oHoq4+QV305/puV0OZWYB/rFLM9onckSYI8waHhBT+
	lRbPhflX/yOZF5eQfQB+d4I=
X-Google-Smtp-Source: AGHT+IGqTgpTBzEY2RQLyQKIQcJ5kJdhiX9G2uvCSdw7ZP/JLjzXwNrA+qUo+bnVcgQ3k6J6S9mS3A==
X-Received: by 2002:a05:6512:39c9:b0:50e:7c6e:f237 with SMTP id k9-20020a05651239c900b0050e7c6ef237mr35751lfu.135.1703446152052;
        Sun, 24 Dec 2023 11:29:12 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id c2-20020ac25302000000b0050e7b04e3b4sm151967lfh.232.2023.12.24.11.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 11:29:11 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3BOJT8Ph032228;
	Sun, 24 Dec 2023 22:29:09 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3BOJT7Ar032227;
	Sun, 24 Dec 2023 22:29:07 +0300
Date: Sun, 24 Dec 2023 22:29:07 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev
Subject: Re: Testing bits/080-wifi on BCM4345/6
Message-ID: <ZYiGg+B/NsWuR64+@home.paul.comp>
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <ZYK/C3LzK8LMOjER@home.paul.comp>
 <3e7f9763-a481-40d1-a5aa-9d71ebe13d98@marcan.st>
 <ZYa2Q8ALPbr09L4b@home.paul.comp>
 <CAF4BwTXJWYGT+8jp9dzxmSN7wbk7xZuy4tNSQDhxJ66UzhhgWw@mail.gmail.com>
 <ZYb8jf3a/CsI3/D2@home.paul.comp>
 <CAF4BwTXm62PxBTM2bNX2MkTF4XUypNJAMpxMFaQ3LP5MHrfBZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF4BwTXm62PxBTM2bNX2MkTF4XUypNJAMpxMFaQ3LP5MHrfBZA@mail.gmail.com>

Hi Daniel,

On Sat, Dec 23, 2023 at 09:43:55AM -0600, Daniel Berlin wrote:
> What you are seeing now is the real state.  The chip and the stack
> now have the same domain .  As such, those channels were always
> disabled *as far as the chip was concerned*, you just didn't see it
> because it didn't display it.  There is code in the driver  to
> enable vht40/80 when the regulatory domain is set right.

The global regdomain in "iw reg get" changes to the requested one but
phy#0 is left at "country 99: DFS-UNSET". However that global domain
clearly affects the channel lists as reported by "iw list".

1. 2.4 GHz channels get unlocked as they should (JP channel 14 stays
disabled but that's likely irrelevant as it's 802.11b-only)

2. 5 GHz DFS channels get all disabled, no new channels are enabled so
VHT40/80 are still not possible

That's with clm_blob from Linux firmware tree.


Another thing is the per-channel power limits reported. My current
understanding is that "iw list" should be showing the currently active
limit, that is, the minimum of: generic firmware limit, current
regulatory limit, the specific hardware limit. So 30 dBm there looks
wrong and inconsistent with the behavior of other drivers, e.g. mt76.


Regarding testing on this hardware, raspberrypi docs say that Pi4 can
be booted fully over wired network after minimal one-time
configuration so that seems to be the easiest option for development.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
