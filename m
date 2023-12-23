Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAD5DF43
	for <asahi@lists.linux.dev>; Sat, 23 Dec 2023 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6inHNWm"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e593c756dso3032678e87.2
        for <asahi@lists.linux.dev>; Sat, 23 Dec 2023 07:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703345299; x=1703950099; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxmaimkNgK+6G0wZ6MKXsQEztKEhOBEcglEzEz8qG74=;
        b=B6inHNWm3d4ejMitccBjBhCR3EC0Z8seyBybxTSlSj+obYt6Mr9yssnJbY7lg8vqUJ
         6YA2zfyzj/bVROgWSWSOn9UFjUfQcsjnlujKl9pJKg9Mj6+rnp7B09sR4h6/wiAbODF7
         PQ/WaXATA0bdDHgvStiLNYOfKrxHDza0ObjVp3PmUqmeGgFpzhg81tmN1G/hLZljwXMi
         mj5mwiYKtz6N+Wx7IZZidk3AnPE2FbztciwCjdjA7hhGuVu25BkHCa9ibLEDJsjp2Jxt
         zvtB6RwP9ohUNQ4sObCoglvx32HvKAIaUrnVuVed4EvaZpIWZp9PbrNnK8hdEbecBFLw
         ND4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703345299; x=1703950099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxmaimkNgK+6G0wZ6MKXsQEztKEhOBEcglEzEz8qG74=;
        b=Tt3FRZ0mPz8D5hUD95usWBcWquzjk8k3ELeWUZEa29KnsHtqmJWN7DAiRvFZ9KEPeg
         rZxOl/k1bLqefkyMIe3QoZCH4n5gXui6LCq7X76azz0EZ5WmAwWBYS93JXlafeiJzpsx
         rj4s7lP+kxT1MocD7yBNGAK1Bl3wIFYDrGm1iDL9XYgGd4KqR5dMkazDXk4hKkPSHwoz
         lxaqFuoZXl4uiaVKS/dnM3CqH0HeBjPnBL0zQnsLvDT3VLzxm60ppjeqr7J7YxRK4ENi
         V7BC+XBsk6tmosKo/W/yLl2s0PgUL2UGdFmijCBtSQQxERIKS2xPwu6YFhhND0GBErUU
         xpZA==
X-Gm-Message-State: AOJu0YzOYThiePDcUo9t9dsjuLs7iprdqYypeZmVYih+DesXYVDpG19T
	iOMvALINe04JwnFHTXZ9lu0=
X-Google-Smtp-Source: AGHT+IF4ippczRQVtMjOOI6lG6RagZ5Fq0/hDM85Mx2c87hoyo7cCGZIsQTCmIBuPI5ZvmxrmfbxrA==
X-Received: by 2002:ac2:4ac3:0:b0:50e:5478:94c4 with SMTP id m3-20020ac24ac3000000b0050e547894c4mr1314147lfp.110.1703345298453;
        Sat, 23 Dec 2023 07:28:18 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id t5-20020ac243a5000000b0050e77984fa6sm5185lfl.259.2023.12.23.07.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 07:28:18 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3BNFSE6u027664;
	Sat, 23 Dec 2023 18:28:16 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3BNFSEdd027663;
	Sat, 23 Dec 2023 18:28:14 +0300
Date: Sat, 23 Dec 2023 18:28:13 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev
Subject: Re: Testing bits/080-wifi on BCM4345/6 (was: Re: [PATCH] wifi:
 brcmfmac: cfg80211: Use WSEC to set SAE password)
Message-ID: <ZYb8jf3a/CsI3/D2@home.paul.comp>
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <ZYK/C3LzK8LMOjER@home.paul.comp>
 <3e7f9763-a481-40d1-a5aa-9d71ebe13d98@marcan.st>
 <ZYa2Q8ALPbr09L4b@home.paul.comp>
 <CAF4BwTXJWYGT+8jp9dzxmSN7wbk7xZuy4tNSQDhxJ66UzhhgWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF4BwTXJWYGT+8jp9dzxmSN7wbk7xZuy4tNSQDhxJ66UzhhgWw@mail.gmail.com>

Hey Daniel,

Thank you for a rather elaborate reply, wishing you a joyful and
refreshing vacation.

On Sat, Dec 23, 2023 at 09:07:17AM -0600, Daniel Berlin wrote:
> The freq differences below are regulatory - the default of the driver before
> fixing would get stuck in it's default custom regulatory domain, which is 20dbm
> for everything.

I don't complain, just noticed it changed. What bothers me more is
every other channel in 5 GHz disabled by default which would make only
VHT20 work there.

> They should get re enabled if you move to a real domain.

I will try it later.

> I am happy to fix the sae issue when I get back if you are willing to recompile
> with the tracing flags on and get me some logs.

Sure.

> If it becomes complex I'll buy apinebook pro to test with.

I do not recommend that at all, it would be much much easier to use a
popular (so that it's supported by upstream kernel) SBC with same SDIO
module and just boot the kernel + minimal initramfs userspace via TFTP
over wired Ethernet.

> AP mode I'll see if I can fix it - it's not really tested well.  I can probably
> make local progress on this first.

Again, I'm not complaining, just tested what I could quickly test. I'm
surprised Asahi users seem to have not yet explored the topic of
allowed interface combinations, it would be curious to learn how it
works on those "more advanced" broadcom modules you got.

> P2P will also likely break if you haven't tried it.

Not even once in my life :)

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
