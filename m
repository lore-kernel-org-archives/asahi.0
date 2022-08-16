Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E353B0
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 16:59:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gk3so20049149ejb.8
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PZiFKHAPInSqLmOQSyV+TmAHEnPDfiBJsJIlSVONBUo=;
        b=LRCjpJNqVhX8469WWIWi7kwgE6So402iY3NGTnuzSThPccWIrskygornwb3D41OzQ8
         AUJcD7neOIjJ1r8h+Jp8C9vYMNzRMuvxPNuRcwR+OxVlO2b01+dqO7h3GoedFTyK4/ix
         FxYRfhKhFY51NZt1Ph4W4hbaBuIKb82elRAmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PZiFKHAPInSqLmOQSyV+TmAHEnPDfiBJsJIlSVONBUo=;
        b=3poowZljLkjrV306jRuwYwdN30pZWCMzmsmGP6cBDCN3TXzE7RwqzMXvqXZfWEs6KO
         kSzlCzpPfsI7SMrUaS1XzNz06H7sWxPw9MlL8sUs8SvDi4785knYhlhCatK0YKcVpBOP
         Pl3PyQXtV2dUwUc2/wFhkyggS5tM5yCePbdmXrCNlFLVkSCk6IDi5fq4DedmWUAWEFXD
         R4Y42DwhGGGc8dEaVMZTQ5PyRLhAYlu4ghXROcHHKzlcG9ro8ba3sKZA5AfGsbThIh8G
         6YRdXqP6sR4k8R4J1cNHAK93wIiVMQvK6Vl3LtNUWfK8CaiVuCJI8NudYcJ6AzfxPFUp
         jkvw==
X-Gm-Message-State: ACgBeo0j0QnB1u9haOA9jahod0nVPPOxIN7J/tpT6bV7X3RiT91O7Nra
	5CRWq7I7T8vP3ZlFOegLGKfgFkiSVQ6ewLBptX4=
X-Google-Smtp-Source: AA6agR6J776QmRxBxxAVxWyD5drpa1/E1EJsJuBL9GXYTSb666Ux3INTqDOXRJohhICubgAg2qp8rg==
X-Received: by 2002:a17:906:98d5:b0:738:3402:197 with SMTP id zd21-20020a17090698d500b0073834020197mr9259981ejb.581.1660669155655;
        Tue, 16 Aug 2022 09:59:15 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id jz20-20020a170906bb1400b007309a570bacsm5610657ejb.176.2022.08.16.09.59.12
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 09:59:14 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso7936891wmc.0
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 09:59:12 -0700 (PDT)
X-Received: by 2002:a05:600c:657:b0:3a5:e4e6:ee24 with SMTP id
 p23-20020a05600c065700b003a5e4e6ee24mr8635263wmm.68.1660669152579; Tue, 16
 Aug 2022 09:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvqaK3hxix9AaQBO@slm.duckdns.org> <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <20220816134156.GB11202@willie-the-truck> <YvuvxnfHIRUAuCrD@boqun-archlinux> <74559da4-5cd4-7cc4-0303-ab5f6a8b92ae@marcan.st>
In-Reply-To: <74559da4-5cd4-7cc4-0303-ab5f6a8b92ae@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 09:58:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=whn=gkf8kOxVPPeTpcgsFk21P9sk4SZRQ26=Jhqo6ewRA@mail.gmail.com>
Message-ID: <CAHk-=whn=gkf8kOxVPPeTpcgsFk21P9sk4SZRQ26=Jhqo6ewRA@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
To: Hector Martin <marcan@marcan.st>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Tejun Heo <tj@kernel.org>, peterz@infradead.org, 
	jirislaby@kernel.org, maz@kernel.org, mark.rutland@arm.com, 
	catalin.marinas@arm.com, oneukum@suse.com, roman.penyaev@profitbricks.com, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 9:22 AM Hector Martin <marcan@marcan.st> wrote:
>
> It's worth pointing out that the workqueue code does *not* pair
> test_and_set_bit() with clear_bit(). It does an atomic_long_set()
> instead

Yes. That code is much too subtle.

And yes, I think those barriers are

 (a) misleading

 (b) don't work with the "serialize bits using spinlock" model at all

It's a good example of "we need to really have a better model for this".

             Linus
