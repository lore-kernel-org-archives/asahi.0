Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C71FE0FD
	for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731494941; cv=none; b=h2odeEWldLP8w1X0ccLRD1IqoC+Knbf+QdPa+4KgYviK3TUYlhOydkQT2KSLi3aJf3NB+3TnlbceBvAFJ/K48uSQ1c0cOLo8OnyMDqIM8fSK4JOz7wZoz6CtFa/eK4N/xYZyIv0VKUjAEUkrmUKS+UL7iag30Zyz6SaRDAF/G7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731494941; c=relaxed/simple;
	bh=pIhC9/hK47e7+MFElUqH8Rd9EA0/oH4OsMHtOgvQWH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkcZCB6Ji43NEAr0/JnQjXqHWPLbKd0Uo2boQmJVAUWq9iEP5WWry0JL12506eR4lwa3d2kKDOjY+WgdBapbSNYE/OQW1r18z6IxUkEVeDZdF22pBifkGgR2xJuFZ4DS+gyTIiSWKoZu5OXDxhzOQWZFfeMM/X2d901T3eMqGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=n/gF/X1i; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="n/gF/X1i"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea50585bf2so66714187b3.3
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 02:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1731494938; x=1732099738; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fCWzNXcfZFUOOoSuUDtlh4LJbgNZ+Kyy0hvbqO83lWc=;
        b=n/gF/X1ijWP2zPcFFq5V1jedLv2IK1LDxWJbPr+Dw1pMICbGJbwVBGgV3wVIXwsAQ6
         i3O27NmVI35SxBTKwVxkXK24ONiK6wFLTWq+lqp3I+J4aNez//6Gr44rPXyusyCQDpNV
         +hzLBc0w3De9FcuF+nsvKDVw9D1pTcPu10A/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494938; x=1732099738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCWzNXcfZFUOOoSuUDtlh4LJbgNZ+Kyy0hvbqO83lWc=;
        b=nx3Exd/c+5l0a3nPdme7S3lMJaYZuKC0uYe2rJOnnkcGTQ520jrU//IB2R2nC3q6kf
         O45zTMG5VJHkJXYeoOnlKrer13+I4bGeMTPywC2qIdBpu7ogo8sVHjIZUg7piYiZDt1Q
         lfvLjdcZSACVPZUknSPnYSaeLoQhkCVqXGFKIw2DF4UYkodQWo//duJ0mLzhIkIjpdCj
         Ijn3tx7KG+BuXs+sjEAoTReS9RcHzWpLvq8P0SNyeos9dRFCEbNLhnDZoS0c2xfGjjKF
         r4iH1yFMxvoVBQteZF87A4onMU/bU1gzfLqRmQiR8wjxIVOPGZA87jyH2C+jsCA0CoXA
         lOdw==
X-Forwarded-Encrypted: i=1; AJvYcCXhz1l6WtfCCIYgzn3wiSmJJNq3VOIcK4ydwU5UCB09uMWg1z+X3UIIFVGbl4tdG1eAPEan+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy8V+NW/h5FUIydlk4/UEqqmSqGykBVt9q4FnldJ3gje7udGmg
	TILhjGaN4vrI+M4gpvF1XG4xuGW2VhlwlFp12MjMNla/irOmAVFEi9uzRGBsPaEPcvbuWaCGoLG
	uHBu4U3b2CJJ2yJV5vkzUtqmzk8qlb760tN0UtQ==
X-Google-Smtp-Source: AGHT+IHGSBNEx1q2vgfYf1kVAx6WwXY/JhE5tWtIMVAz6Et3j22+/n6fQViPrJ6PXuKqX/MEroYo6kUouNWSXr61TDc=
X-Received: by 2002:a05:690c:6601:b0:6ea:7b98:3a00 with SMTP id
 00721157ae682-6eaddda3741mr188382637b3.16.1731494937730; Wed, 13 Nov 2024
 02:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113-dax-no-writeback-v1-1-ee2c3a8d9f84@asahilina.net>
In-Reply-To: <20241113-dax-no-writeback-v1-1-ee2c3a8d9f84@asahilina.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 13 Nov 2024 11:48:47 +0100
Message-ID: <CAJfpeguawgi_Hnn2BwieNntbOCB1ghyijEtUOh4QyOrPis--dw@mail.gmail.com>
Subject: Re: [PATCH] fuse: dax: No-op writepages callback
To: Asahi Lina <lina@asahilina.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Sergio Lopez Pascual <slp@redhat.com>, asahi@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 20:55, Asahi Lina <lina@asahilina.net> wrote:
>
> When using FUSE DAX with virtiofs, cache coherency is managed by the
> host. Disk persistence is handled via fsync() and friends, which are
> passed directly via the FUSE layer to the host. Therefore, there's no
> need to do dax_writeback_mapping_range(). All that ends up doing is a
> cache flush operation, which is not caught by KVM and doesn't do much,
> since the host and guest are already cache-coherent.

The conclusion seems convincing.  But adding Vivek, who originally
added this in commit 9483e7d5809a ("virtiofs: define dax address space
operations").

What I'm not clearly seeing is how virtually aliased CPU caches
interact with this.  In mm/filemap.c I see the flush_dcache_folio()
calls which deal with the kernel mapping of a page being in a
different cacheline as the user mapping.  How does that work in the
virt environment?

Also I suggest to remove the writepages callback instead of leaving it
as a no-op.

Thanks,
Miklos
