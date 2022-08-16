Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D02F25
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 16:43:48 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id cb8so8564572qtb.0
        for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc;
        bh=mNYcXw+6OCOLZbXQYQLHUSCGDuExOybfRt9j3BD47FU=;
        b=aljcIgx1vNs0ATxiQdCFDhTpfP9ZFju0rrLyUBnoV3bDPwfudWuoUYpC2HNOOxcpOW
         5JJgy89zTmFNB9LOwjHKS3u5SSM9lH1RIu717MOEHaHRG+4VN4V7qZNHea275SPDcIJu
         tsZ/I64X+JBB/62fLVT0ABJ0yPYkZ1krvAwQgxHhKkw9ifT5fgN/7Va3ieSOvXfeoxb0
         elYiC6vjxEBSGElh8nSOhJ28bPGL49cf4xUF4uk0IaTrIFJZB6wVtzCr16M6549jPu9c
         3gW8jTj0VE5UqnDmloR3GDbd5h85fCLloxNxe6v2q/bIjyuKf2RxzEb1IwrlD4f5svW6
         F6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc;
        bh=mNYcXw+6OCOLZbXQYQLHUSCGDuExOybfRt9j3BD47FU=;
        b=YBdkFtvTKfLxzp/GuJ23REuLnlDrR4OEm8Z+v4gLFYG7T0nuqLviclxHh6ssK3m+io
         WtC27qOWrJlRPdX4kc6hXkp5TtvEMlklVHLGNVVl1NaVMYw/AVA+/YqZxJnSASSuqhbe
         8Wd0iQyMSoIGZWKMqgcdIeQQ4FUuuXnS8+l1LOtVQewfUbDPw2xrlpPmqvpHqzihwezY
         GNkhse65BPNYgFo+v5Tmpthf0uQj8iu812SfJB70w2cFElDnNVFGXXD8hEFp1ey7J+ME
         ptOXT1WhJ7zscLjy3OL4Glx9jEmHHFckiawSBxYBf5p6Husu4FuS0491SEo9kI+EFllF
         rUHQ==
X-Gm-Message-State: ACgBeo1IKY+DfMHjGpvjuZAAdWVX32msM+xFS0FRzLtkDAxf7bfxcKF4
	2rjHSl1ZAoy/Q5LNFfqrNX4=
X-Google-Smtp-Source: AA6agR61gcjcPiOJhGjgqszCvfHKGTe6Zc79v/Ow7PCU6yxsmHts/AB5J3hc5C/5MLW2gkNnxwixzw==
X-Received: by 2002:ac8:5853:0:b0:343:7b95:96ff with SMTP id h19-20020ac85853000000b003437b9596ffmr16743248qth.386.1660668227607;
        Tue, 16 Aug 2022 09:43:47 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id bp19-20020a05622a1b9300b00342fdc4004fsm10370308qtb.52.2022.08.16.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:43:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id ABA4A27C0071;
	Tue, 16 Aug 2022 12:43:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 12:43:46 -0400
X-ME-Sender: <xms:QMn7Ymi77u8mc5cNtjMaIcoeq5Z9nBIcgmQdjqn3GlxyQ58Gqb6wyQ>
    <xme:QMn7YnBX2-ArQtOOhvROK0N0iXBu7yNrpfUWP1pPcWaNe_meYQCWcXmb0Tv_c0CVp
    cwUp1ygUc5JOFoEMA>
X-ME-Received: <xmr:QMn7YuEyk4AHOA32-1jadhzRncOH7mZ6bazoY_doi29KOT9jOgWWYjzFRAwfQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:QMn7YvQ7skirub5snZFKqWO6Mf35wB-D5gt33anTSAtpVVtSBTQ3OA>
    <xmx:QMn7YjyD9C5I1R2EouUVZYML0qyRGA64IY6bRzoDU3K0U0tSPtr2zA>
    <xmx:QMn7Yt5kOjBXj4TpZep9v8I2Cl5LUISL806JVrrr3rI1BtYVaB-gow>
    <xmx:Qsn7YjAzZW9M2HpfjNagMtjfsruOyUzs9pv1eh1doAPe_Buxycacpw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 12:43:44 -0400 (EDT)
Date: Tue, 16 Aug 2022 09:43:29 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Will Deacon <will@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, Tejun Heo <tj@kernel.org>,
	peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org,
	mark.rutland@arm.com, catalin.marinas@arm.com, oneukum@suse.com,
	roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Message-ID: <YvvJMSGLtIZgP/Qd@boqun-archlinux>
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <20220816134156.GB11202@willie-the-truck>
 <YvuvxnfHIRUAuCrD@boqun-archlinux>
 <74559da4-5cd4-7cc4-0303-ab5f6a8b92ae@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74559da4-5cd4-7cc4-0303-ab5f6a8b92ae@marcan.st>

On Wed, Aug 17, 2022 at 01:22:09AM +0900, Hector Martin wrote:
> On 16/08/2022 23.55, Boqun Feng wrote:
> > On Tue, Aug 16, 2022 at 02:41:57PM +0100, Will Deacon wrote:
> >> It's worth noting that with the spinlock-based implementation (i.e.
> >> prior to e986a0d6cb36) then we would have the same problem on
> >> architectures that implement spinlocks with acquire/release semantics;
> >> accesses from outside of the critical section can drift in and reorder
> >> with each other there, so the conversion looked legitimate to me in
> >> isolation and I vaguely remember going through callers looking for
> >> potential issues. Alas, I obviously missed this case.
> >>
> > 
> > I just to want to mention that although spinlock-based atomic bitops
> > don't provide the full barrier in test_and_set_bit(), but they don't
> > have the problem spotted by Hector, because test_and_set_bit() and
> > clear_bit() sync with each other via locks:
> > 
> > 	test_and_set_bit():
> > 	  lock(..);
> > 	  old = *p; // mask is already set by other test_and_set_bit()
> > 	  *p = old | mask;
> > 	  unlock(...);
> > 				clear_bit():
> > 				  lock(..);
> > 				  *p ~= mask;
> > 				  unlock(..);
> > 
> > so "having a full barrier before test_and_set_bit()" may not be the
> > exact thing we need here, as long as a test_and_set_bit() can sync with
> > a clear_bit() uncondiontally, then the world is safe. For example, we
> > can make test_and_set_bit() RELEASE, and clear_bit() ACQUIRE on ARM64:
> > 
> > 	test_and_set_bit():
> > 	  atomic_long_fetch_or_release(..); // pair with clear_bit()
> > 	  				    // guarantee everything is
> > 					    // observed.
> > 	  			clear_bit():
> > 				  atomic_long_fetch_andnot_acquire(..);
> > 	  
> > , maybe that's somewhat cheaper than a full barrier implementation.
> > 
> > Thoughts? Just to find the exact ordering requirement for bitops.
> 
> It's worth pointing out that the workqueue code does *not* pair
> test_and_set_bit() with clear_bit(). It does an atomic_long_set()
> instead (and then there are explicit barriers around it, which are
> expected to pair with the implicit barrier in test_and_set_bit()). If we
> define test_and_set_bit() to only sync with clear_bit() and not
> necessarily be a true barrier, that breaks the usage of the workqueue code.
> 

Ah, I miss that, but that means the old spinlock-based atomics are
totally broken unless spinlock means full barriers on these archs.

But still, if we define test_and_set_bit() as RELEASE atomic instead of 
a full barrier + atomic, it should work for workqueue, right? Do we
actually need extra ordering here?

	WRITE_ONCE(*x, 1); // A
	test_and_set_bit(..); // a full barrier will order A & B
	WRITE_ONCE(*y, 1); // B

That's something I want to figure out.

Regards,
Boqun
> - Hector
