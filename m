Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101444D014
	for <asahi@lists.linux.dev>; Wed,  3 Jun 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487147; cv=pass; b=po3vNl1a/dnu2nu54BfTmjz7/l8wV5HO8C+yEc2WLgUS/1gUuOGP3U91mev/+J3T9NsmvKzBZiODnlbzfRTdEwjPPvp0pm7C/9PcLRMsNiBX8FHSteDOgtzf4vL9/QfLwqhNqWRkDkbt0LusC/YHPUzwT0KHH9OA1uRzv3+ReTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487147; c=relaxed/simple;
	bh=WvYiWVii/9XHPBCuvjEz7z2tT9Ftm3VX9GK6hXfSsRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mT3g5VM/n/gm9jYA+73kulzsH+OyI4sPOwgZGsGG3TKv7wciDv9qDhh08fRT1/+bY0sLXIZh4cz1QmmAiFtWgO7tJUuDdt4mOPSBS2f9UCJS2903CDMGZxl5btVlXf4P3w3Kq2cSkC0YaANA0zBv7LcQxuuNavrWCUfZfcD8R+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHui/x3F; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHui/x3F"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e615efd7d7so9383434a34.2
        for <asahi@lists.linux.dev>; Wed, 03 Jun 2026 04:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780487145; cv=none;
        d=google.com; s=arc-20240605;
        b=DlaSyAg5dR4o9l7yZko9jv3K/+wy8MgnU28nX/GIBKaiqHeMVy5+vbqd0htYnHp4To
         eOpHTjEbTaWppU2mGpxaa5KmOXR6Y8f40G7YJR4UVV92DpWJylm6tKRli7pFsk1JsSWK
         C9NRrsAohqjQOioLEz15EnNwKGnV+G63Hr9EFmKZ5OyFr20ORao02+q6CUdLcrbfKxXE
         0j3F/SVTakNlMT1WA7SSim0v9in0Zv2qEXix0eGdiz1M+s1weuwCR7HfUAIyPoqe5Okj
         pcPVgTPI9oLM/y+vTaI6+COPj9a6x8HGQ14Shf6idp178Gvvp1H4y8kV9LUVHYquxFUl
         NtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=;
        fh=U5dHByJIjL+dg+2zi2Npbc4zFhPl1jlYsGXIuBy5iIY=;
        b=WkRVmsnACg1T+3iRrDgcJCC28H93dHQYffUJGQgjpEDjB2e0Rhz7nr+cJhhNpiuWQL
         n3+vYgfDdkWjZa00J2bJAq/FjEIyR60kEjgyDOr1PV0iWx0Yatj9VhpQg5jCTIt+LnRC
         17Xf/sXMKR7f9d4HWd8GyX9npIKi/CnzYwU/gkyINt2aORCjUx3Edf1a881S2PiQiObh
         oBYrRk3XaRRfFnF5AN/MbnXp4DK2KVNcF36SLTyjs5muzdiSKzhW75ZqFoFE6f0qpHXp
         sWEZl6+qZpO9lzP+5i02nL99sPwWBuN77pVykePtFoBN1ooJQnV/bpL15U6AHkXN9R6A
         F0nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487145; x=1781091945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=;
        b=dHui/x3Ff5dOFENDNtdIRNWVNU+1VKiBlyw1S2GRm1jaV42jXpv21yQo+FFith2T/0
         sVO0ldPfpmvYpTpxW7c5usKLcPRz3rvPxQVDl4N5bMzNIxJTuySe1+c6QLnwC1I6V4hM
         UGebAhMoGP1PbHKrBipJcLH7B0IAPe1Bs0jDjpijW3MTnCW9Yi86xQaols6C3W/fUs8X
         FJC1aXATQR7NyGtxom5OwyL4nWn2pcx2mZnrkBv87hSdVMmt5+3cwNcUuEZeMVi42YN+
         I1MMaDLuu4itGZO9W2quy1DENGMIGSrvep+CaksP3UdjvnYRYOREuXguck8ydLYt9tEX
         5jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487145; x=1781091945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=;
        b=V7/wndNxX0pF1vcF3GhS7rwmkks7WUoqw94wE4we6ypTS5KxVo7z6QCO5bp2rNMKCe
         zarLz5uhnxiu9Xd+V61ukyqAffDKfeybrsbwfilgnUFVpmk3uPFa/JU9xYp01BBmlukl
         m6v/rVmDLPS0+NfzwrT4oCTKh2kY7HlP0YkT4w/Xe6rO2Bz4lofsOihqcNcB9d/fRRpf
         GPTm3LzhMrJaPssEa3DLdMyC4GNTYz0Par0d0rm+8wbfLyODXIrUpxE2VoMTfE+ZFG4T
         tCbQWBBz3rOrNb7pmvNHChMr6LPJTmLLW7qmHRMUZ6N5XYdRvRm/UryqzRQYOJV9xdmk
         V0YA==
X-Forwarded-Encrypted: i=1; AFNElJ+cy9XB9rWyOG5veoOS4Ufag5LH3odzwcchAptF72uepVLVsxVTo+zTUhPa2vLB8nH6krOsPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIlECOBQLSZtqkUW2u7aymStRkuY+VbaRXoNMGxZr3R+WfhWeb
	9VEgOX7bW5RavddBB31k/rCgEGmKIXs8jVfPxeH5L+EloRBbI5OLEcZRsF2uWj+cbx1OPEL+Bf9
	2uGHYtByC98fbD9XdsTdDAyaWD2vl28I=
X-Gm-Gg: Acq92OGuwBTlfrAhH6cS5sL8gZYHkqOClQIESX6OXBDjpqyPwxzQSa8lDsWkpEQ7Vf3
	J+vmOcjwsT7DBjxwTKCID5Z7Jn+Ei1imOFgYoNU/8WQiNfm3JnN9eBwPZ0Db1FYQLltrYlJICTS
	J6Rs3c07+9BtG/20u3mT21X3peNBl2HnVh9OZky6iflbaiPeseo/RtEXcnoYxO9lLFekbSfB5GJ
	6/BgumY3OgI60OFXFyZuOaZq5NG4kzTz2Nbrfq/pwEfTIP/SzPhtuGGIhq4ushidUc62HCMMsEi
	gRUBjopvIpG/cdSQvZGjjcQA1ols5S0GjGQCC0apRVIgFop4yrSAsWpqleYvN2Iit58oEab8qF+
	VY6/TG0uESmZj9fI0tboRxTbynERP3AA=
X-Received: by 2002:a05:6830:448a:b0:7e6:c734:94a with SMTP id
 46e09a7af769-7e6e9df435cmr1717770a34.23.1780487145503; Wed, 03 Jun 2026
 04:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603072205.3291888-1-hanguidong02@gmail.com> <ah_5utfy2oJbUCw7@kbusch-mbp>
In-Reply-To: <ah_5utfy2oJbUCw7@kbusch-mbp>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 3 Jun 2026 19:45:35 +0800
X-Gm-Features: AVHnY4LflgzL8o28wk732XkC7u2yUcX4Dke1kxTIgi6mAtBN5-lOxr2Un6SRfDE
Message-ID: <CALbr=LbQPZNiztjqTCmw3J+iNcXuQRjNgHpbM7TJD1ib+wTZvw@mail.gmail.com>
Subject: Re: [PATCH] nvme-apple: Use acquire/release for queue enabled state
To: Keith Busch <kbusch@kernel.org>
Cc: sven@kernel.org, linux-nvme@lists.infradead.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 5:54=E2=80=AFPM Keith Busch <kbusch@kernel.org> wrot=
e:
>
> On Wed, Jun 03, 2026 at 03:22:05PM +0800, Gui-Dong Han wrote:
> > apple_nvme_init_queue() initializes queue state and then marks the queu=
e
> > enabled. The interrupt and request paths check enabled before using tha=
t
> > queue state.
> >
> > The existing wmb() after WRITE_ONCE(enabled, true) orders the enabled
> > store before later queue use, but it does not publish the earlier
> > initialization before enabled becomes visible.
> >
> > Use a release store when enabling the queue and acquire loads when
> > testing it. Keep the existing wmb() in place for the
> > store-before-later-use ordering.
>
> Doesn't smp_store_release() already get you those semantics?

Yes, smp_store_release() is enough for the ordering intended by that
comment.

The old wmb() after the store does not really provide that ordering.  I
kept it only because it is not identical to a release store, and I was
worried it might have some other ordering effect with later queue-start
operations.

If you prefer, I can drop the wmb() in v2.

>
> Also, there are a few other places doing the READ/WRITE_ONCE() calls in
> apple_nvme_disable. Do you want to update those too for consistency?

For apple_nvme_disable(), I left those READ_ONCE()/WRITE_ONCE() users
unchanged because they are used for the shutdown path rather than for
publishing queue initialization.

The READ_ONCE(anv->ioq.enabled) only decides whether to issue delete
SQ/CQ commands.  It does not consume the queue state initialized before
enabled is set.

The WRITE_ONCE(false) users are followed by mb(), which orders the
shutdown/quiesce path.  A release store would not replace that.

If you prefer the consistency, I can update them in v2 too.

Thanks.
