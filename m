Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667581103
	for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 18:59:08 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c20so6145407qtw.8
        for <asahi@lists.linux.dev>; Mon, 15 Aug 2022 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc;
        bh=AS0soNDMMV7u+2cQKm1nwJsb8emAdbdBom1uv9vfFsg=;
        b=IUlLXwJRSiYrd715Es9dp8sDubvAtk9bxIOZF9gl0I+RnlrySlQ1P57Cf6HbA624Ct
         /I9Sk6nGCrypfAPZVkLs7L4cPmFamal/8BAOCvBA2tHiJ35I5r2Pc055Q04uAtR/xans
         98QL0xaquD6AVxmLpdg7ShVj0vMm8HLrPzudEZvMqqPJFbIzkh/HRLdZvXEkiB8T2yzA
         rSEhju1BNJg2maUl2PuxYDAQ1gRCjy47vr+8kg1498rQqODvNKKE1DL7FsdD2huifL5r
         1kTlRvuEmedg1WsmwP1Y61U1Zq2Lj5k1hoK9VIdh85pON+izZxsjB1/gKH2D0QzopRtX
         HXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc;
        bh=AS0soNDMMV7u+2cQKm1nwJsb8emAdbdBom1uv9vfFsg=;
        b=yQhqy+HnxF0SpTStIU61zf1KNMjS+mozQK8qvbw59lDoBeay+UbaLsiOZkugbwcvMF
         2Wug1owWNEDcfjWA2nDAgAXeW/pXtclII7AhnX3pAbxIXyTzz5i4ePPCeu2sXD5WLd3D
         LtFh0wFRcZp31bantWVERgFuulk/2miISt1bG/8tsbuw8DDQBMliKncn5QktbKwPbIM5
         EF7VDbgTBClPQxT2urRyth5aGRpfv373UMYRJbUbrzXFwxaX21Rd3S8yi0idd4rPRlFf
         D255nmUvr1zxmRRMRTnTWD5VSUzMN5xrtHOYw2UpPHwUZYQgUqi75d8A2R7t86M/91eA
         dBvg==
X-Gm-Message-State: ACgBeo3rryN4xixyXJk2wd2R+hTPsSlAi24xk9znnORztDjJnkOVuclb
	Fr6wKDxi0Du+NiA+1jYQ2WkjRxkn3BI=
X-Google-Smtp-Source: AA6agR5WaY3EVqsYJmjLav/hR5heggaPRUyCFLp2B8ggpHxvn4BP1KwuLEPsivV8j9DvTUp+STpJIg==
X-Received: by 2002:a05:622a:291:b0:343:7e97:db08 with SMTP id z17-20020a05622a029100b003437e97db08mr11523779qtw.58.1660589947251;
        Mon, 15 Aug 2022 11:59:07 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id h13-20020a05620a284d00b006b872b606b1sm9489331qkp.128.2022.08.15.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 11:59:06 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 554AF27C0054;
	Mon, 15 Aug 2022 14:59:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 14:59:06 -0400
X-ME-Sender: <xms:eZf6YpJqge2d8-NRvlTotugocv4JsYYHV4eGw_YxeIksSkz0rj_KKQ>
    <xme:eZf6YlKoZ4jCIdvVsNl4rFFsR3MupMD_5wE20nnjewMDD7e1QOPpbovpP2TFRlwE7
    PmMqSsL7xzaswaGyw>
X-ME-Received: <xmr:eZf6YhuvVHRLSSqBNW7IBxBIeZqGM1Zp7PS-SFGbiHhUO0wv2MF8b6UsC-d-WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:eZf6YqY8KLlKbkG07P2MoUY2CH5X1R2jPBbf9dMES13Qj9Z1L2KrNw>
    <xmx:eZf6Yga76hVO7KSvFBtGPUV1R9Wgys2Tb41rl3JoFofAjUuQ_LzSmA>
    <xmx:eZf6YuChZ1ebz2sOncRjiWSeiFZ5aaZg655C98gyRHKOmYYfJc_NhQ>
    <xmx:epf6YqDsqZgXyySF1ppUzgljWXX7PsPUqqAuL8i0UmJxxuT914FiyQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 14:59:05 -0400 (EDT)
Date: Mon, 15 Aug 2022 11:58:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Will Deacon <will@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Asahi Linux <asahi@lists.linux.dev>,
	Oliver Neukum <oneukum@suse.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Debugging a TTY race condition on M1 (memory ordering dragons)
Message-ID: <YvqXbApYbGGEqQl+@boqun-archlinux>
References: <6c089268-4f2c-9fdf-7bcb-107b611fbc21@marcan.st>
 <20220815134711.GA10374@willie-the-truck>
 <63cd54a8-3c48-d1b9-406a-c521bd02ee4a@marcan.st>
 <YvqKtJn5eBsDJXBI@boqun-archlinux>
 <8ccfdd2d-ef77-4586-e50c-985e1d13726a@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ccfdd2d-ef77-4586-e50c-985e1d13726a@marcan.st>

On Tue, Aug 16, 2022 at 03:26:21AM +0900, Hector Martin wrote:
> On 16/08/2022 03.04, Boqun Feng wrote:
> > On Tue, Aug 16, 2022 at 01:01:17AM +0900, Hector Martin wrote:
> > Hmm.. but doesn't your (and Will's) finding actually show why
> > queue_work() only guarantee ordering if queuing succeeds? In other
> > words, if you want extra ordering, use smp_mb() before queue_work()
> > like:
> > 
> > 	smp_mb();	// pairs with smp_mb() in set_work_pool_and_clear_pending()
> > 	queue_work();	// if queue_work() return false, it means the work
> > 			// is pending, and someone will eventually clear
> > 		      	// the pending bit, with the smp_mb() above it's
> > 			// guaranteed that work function will see the
> > 			// memory accesses above.
> > 
> > Of course, I shall defer this to workqueue folks. Just saying that it
> > may not be broken. We have a few similar guarantees, for example,
> > wake_up_process() only provides ordering if it really wakes up a
> > process.
> 
> Technically yes, but that doesn't actually make a lot of sense, and in
> fact the comments inside the workqueue code imply that it does actually
> provide order even in the failure case (and there are other barriers to
> try to make that happen, just not enough). Note that the ordering
> documentation was added post-facto, and I don't think the person who
> wrote it necessarily considered whether it *actually* provides
> guarantees in the failure case, and whether it should.
> 
> wake_up_process() is different because it doesn't actually guarantee
> anything if the process is already awake. However, under this
> definition, queue_work() guarantees that *some* work execution will
> observe every preceding write before queue_work(), regardless of the
> current state, and that is a very useful property. That is something
> that wake_up_process() semantics can't do.
> 
> Without this guarantee, basically every queue_work() user that's using
> some kind of producer/consumer pattern would need the explicit barrier.
> I imagine that pattern is very common.
> 

I agree this is handy, but an unconditional full barrier may be costy to
some users, and probably unnecessary if the users periodically queue
the work. In that case, some successful enqueue will eventually make all
memory accesses observable. Also if workqueue users use their own
locking in work function, then the barrier is also unnecessary.

The document part of course needs some help to clear things up. But I'm
not sure "strengthen"ing the ordering guarantee of queue_work() is a
good idea. Maybe a dedicated API, like:

// More work is needed for the @work, it has the same semantics as
// queue_work() if the @work is not pending. If the @work is pending,
// this ensures the work function observes all memory access before
// this.
void queue_more_work(struct work_struct *work)
{
	smp_mb();
	queue_work(work);
}

Regards,
Boqun

> - Hector
