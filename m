Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EBA1DDC18
	for <asahi@lists.linux.dev>; Thu,  6 Mar 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249534; cv=none; b=HHyIOU2ycwF7ditD3CMpvtPBxgz7hz5zbEsc+0tzsIqDj74fW+dwEbz8IkC1FtbErL100NeQT9xqt7byNPOnLHNUzY8T9sGi+e0IN6v1+5b1uKuFumnfqOU5KoYYq2GheMZd9eeePHFU+uu/rFXD2RJyqQbRpGAn0HSoqeAjUYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249534; c=relaxed/simple;
	bh=pa2pqjTzw4q5VypT9EDLTaZO/zP/qbuXj/8Mk6tgbig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8ULq3f5VeJhtpRHb1vzKC99guDsh+G8GbQJt6FxrxO4mYA6r9RrWFuOPAv7ctMiMMaudMQ+2hDD1GK+bdEaRjUFmESqdCM0/MqgxnoE6By8/B9OzWQZsK4e7HQyj7AcYbohnzsZOp8Cnts/nRGhp3o1z5sjOlCAjXfhHq+Fg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIFHzwAk; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIFHzwAk"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f6ca9a3425so3838277b3.2
        for <asahi@lists.linux.dev>; Thu, 06 Mar 2025 00:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741249532; x=1741854332; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l11SkgWqUPrtSyPOaTCEHvWbGMPH1FvVn4OSdWqPLcU=;
        b=SIFHzwAk2jObTPkFYmwEgHDScV4bAxFw/27i37wmPrk33Cbq0Q4wqOYaxgZu110PcM
         iZr+3KuPfGoK5PWoHiQ8CLZR//D89JTV04QyDhOaMsCqiDt7wfP0f1EAKgr814APRx6+
         YC1Yhl4ZHHZnnzhqRMBsKVZEQGytLRD0a6TQt1wL+f45/1PhgG5n7Ul2Z48QtxfmoMIc
         i6U2M87Ph6TdfM/9gIVQkpofRvK+6fVgWUu9XGsERirkVImo6UI2lnDhykv+94iRJl9p
         1DDrlBjR3+BNk5gWHaWXK/sBHvYlz0SU2ZGR7C91753h0GEXdNujbG3TjCaRmkYa8Z/7
         B9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249532; x=1741854332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l11SkgWqUPrtSyPOaTCEHvWbGMPH1FvVn4OSdWqPLcU=;
        b=mI/GY4jQTOeb9pPMwAK5uWq4l2GIjTlcbeCbNFikf/ZGK++HlsUlOS38rw2cZsViUr
         I3nl/hpzHyUaQOwEeh9VzI9slC9Tnk/R8GJH6ywoF9aitpY7FYu0Qui0yAJCDh/kMHbL
         RAB1g42WY3FNfSkMqBXkTYcYyAPD8iFIti2JWPOtSM6OYcNkLBeTCRF1vs1qlyUa97wj
         74KndpSENwU7k788l1EieiZcAsqZd7KU4tXaIqMr5UQp3H67EYFIUQBIEr4GFEGu7Yqk
         x1S/KEVr9XTNDlEMUVHdEADW2W/sowVoLOs+LGkYmnYA2bBxMxcaMnDb34yW5kHQBxuQ
         7aYg==
X-Forwarded-Encrypted: i=1; AJvYcCXtRT4wtpzuLjQouCI8wGLUbqKJd8+6yW6Qu+W0nHOiA3zmxTLgjYN0XN0IPAPWDEaiFe+yHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2k1U7vSF/vBJ4KxbmL5IMBxYktdOfwstRmBIGO0dbHmsXqbfU
	JuFFlK4kHCb5fxW+oGiD+3kujiunUqfijj+gw6pJnJlZ+M8PGpAcpYuBDsneKFacSOsw1QZvIDU
	tqI2TDDxB49+PTWETEII8QXOaok8=
X-Gm-Gg: ASbGncvvkT8LlHfA5d/5zwRyrEll0f8tqPisRebT22/YIBoBj6a2FNGrGCLSl+7QrFi
	25zA17rT/1ioFIKtKITfGPECKaE/FDvWgdx2BFHc+tsGyb2YG1UKtNLcc15UZIzDbW33BLbgcjT
	1umofA6kIMbndFSEZONnoLp35R2WM=
X-Google-Smtp-Source: AGHT+IFnspkvdpJ+HPHBG/KH8TGaWDZN0+StO/ZWaAuyUTjQwZy69YzKVcuXuloS7kwM1iyp/LGVYtDT6bnacFmZ8Iw=
X-Received: by 2002:a05:690c:4885:b0:6ef:5097:5daa with SMTP id
 00721157ae682-6fda30765e7mr87697697b3.34.1741249532155; Thu, 06 Mar 2025
 00:25:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com> <20250305-spmi-v1-2-c98f561fa99f@gmail.com>
 <f17372963b92074144b07d34f3e91ba7.sboyd@kernel.org>
In-Reply-To: <f17372963b92074144b07d34f3e91ba7.sboyd@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Mar 2025 09:25:21 +0100
X-Gm-Features: AQ5f1JqQuLKh7WecZEc6nmQrvFQ9MPHH5tqpXbx3DWso9KKNvdQNFg8hYDfSVJo
Message-ID: <CAMT+MTREFq2_ABXZF-WsAkw9qP6eXd7gQwgFGm7fw6nBntdbyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] spmi: add a spmi driver for Apple SoC
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jean-Francois Bortolotti <jeff@borto.fr>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 23:11, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sasha Finkelstein via B4 Relay (2025-03-05 12:26:40)
> > +       while (len_to_read < bc) {
> > +               rsp = read_reg(spmi, SPMI_RSP_REG);
> > +               i = 0;
> > +               while ((len_to_read < bc) && (i < 4)) {
> > +                       __buf[len_to_read++] = ((0xff << (8 * i)) & rsp) >>
> > +                                              (8 * i);
> > +                       i += 1;
> > +               }
>
> Is this ioread32_rep()?
>
[...]
> > +       while (i < bc) {
> > +               j = 0;
> > +               spmi_cmd = 0;
> > +               while ((j < 4) & (i < bc))
> > +                       spmi_cmd |= __buf[i++] << (j++ * 8);
>
> Is this iowrite32_rep()? Perhaps unaligned sizes have to be dealt with,
> but otherwise I suspect it would be more efficient to use
> iowrite32_rep() until the number of bytes is less than 4 and then do the
> one extra pack.

I think it would be better to leave them open-coded, io{read,write}32_rep
casts the buffer to u32 and accesses it that way, probably resulting in
unaligned accesses, and we are on arm64.
