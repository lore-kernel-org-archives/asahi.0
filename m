Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC49331A41
	for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867692; cv=none; b=HifHLQFbWdqIFh9tcrKLh3JSdJxo30PHUhnnDZqbGy39YqLNGREPrTJ7L0s+IZ3abZlHXPdbfLiXg8+2R5R7+yu5QzVlyBOB0pe/XRHMVP0ERr9gBt97KydeBEdbD5LyFLwmQFKkuJjvI5hTR44RqHxyzrBZh/geXrZ9zd4JF0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867692; c=relaxed/simple;
	bh=WFB9ZDoOqVm9cu0zzHzoJnb9cghOb9BIO4ocviwzJkE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PCpPqhmidOTqkyQVfwHamII2678drFg+nKEtXMq+ZpM264LhTqQu+6WwkZppgjRMyxgLDHZgzFSNIdAubUqvGOpVrpxtUeMjLQ/3kjHdI3pW1IevYQ9QKWUO72I1t5sVhdYJlV+jlc5RlNU+v0KhLiZzdzgP6utk97bHn2xiAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdgT9um1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7Yl/P5L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdgT9um1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7Yl/P5L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NdgT9um1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g7Yl/P5L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NdgT9um1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g7Yl/P5L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE63675F42;
	Fri, 19 Jun 2026 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781867689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=NdgT9um1MgonkyxrgX+0f7d+CyCvpxEmUhqmJKbQW9+jFKtud5k2Rb8jTDdo4uC75+O6MO
	pkXMlhuHQiwfPe4FcHod1i8KGjyuwPRgROIN7fFbhjMYsk6JfyqP1Mcbj7DzUvl0+n4RJj
	4gSmQEhJlLmViXN9IZBt7t7zquN9v+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781867689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=g7Yl/P5Lz1lvm6VHoMQF1QsbJXVPzTeuORP/mZ0Ej0TGUhh/byZGeItazEsRqhWtqfYfrY
	KuovKhphpK/l3ZCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781867689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=NdgT9um1MgonkyxrgX+0f7d+CyCvpxEmUhqmJKbQW9+jFKtud5k2Rb8jTDdo4uC75+O6MO
	pkXMlhuHQiwfPe4FcHod1i8KGjyuwPRgROIN7fFbhjMYsk6JfyqP1Mcbj7DzUvl0+n4RJj
	4gSmQEhJlLmViXN9IZBt7t7zquN9v+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781867689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vA7XD4tzqECot2FsGyw2UfmWr3fnKsx8iWlkrI2RB3A=;
	b=g7Yl/P5Lz1lvm6VHoMQF1QsbJXVPzTeuORP/mZ0Ej0TGUhh/byZGeItazEsRqhWtqfYfrY
	KuovKhphpK/l3ZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8791779A8;
	Fri, 19 Jun 2026 11:14:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kz6MM6gkNWoGWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 11:14:48 +0000
Date: Fri, 19 Jun 2026 13:14:48 +0200
Message-ID: <871pe2kcif.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Laight <david.laight.linux@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
In-Reply-To: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
	<20260619101346.2ec49087@pumpkin>
	<ajUcTfG3vSGz3n3d@opensource.cirrus.com>
	<CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RLtz4y7943h1dm9t59x9i47taa)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,gmail.com,kernel.org,perex.cz,suse.com,chromium.org,cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[lin];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 19 Jun 2026 12:57:57 +0200,
Bui Duc Phuc wrote:
> 
> Hi Charles, David,
> 
> 
> 
> > > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > > from the function above, if memory serves it attempts to release
> > > > > > the mutex on that path despite it being above the guard.
> > > > >
> > > > > Indeed.
> > > > > I believe clang will complain.
> > > > > That makes these mechanical conversions of existing code dangerous churn.
> > > > >
> > > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > > code any easier to read (other people may disagree).
> > > >
> > > > I built the code with both GCC and Clang and didn't see any warnings.
> > > >
> > > > My understanding was that the early return exits the function before
> > > > the guard is instantiated, so it should not affect the guard's cleanup
> > > > handling.
> > >
> > > When a variable is defined (and initialised) part way down a block the
> > > compiler moves the definition to the top of the block but doesn't initialise
> > > it at all, the first assignment happens where the code contains the
> > > definition.
> > >
> > > However the destructor is always called at the end of the block.
> > > So if you return from a function before the definition the destructor
> > > is called with an uninitialised argument.
> >
> > My understanding was exactly as your David, but it seems that isn't
> > the whole story and indeed I had to fix a bug in our SDCA code
> > that hit this.  However testing this out, results in some things I
> > find very hard to explain.
> >
> > It seems as far as I have managed to test, the code below works
> > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > on the error path.
> >
> > int function()
> > {
> >         if (error)
> >                 return;
> >
> >         guard(mutex)(&mutex);
> >
> >         stuff();
> >
> >         return;
> > }
> >
> 
> Thanks both for the clarification.
> 
> > The situation I hit this in before that doesn't work was actually
> > this:
> >
> > int function()
> > {
> >         if (error)
> >                 goto error_label;
> >
> >         guard(mutex)(&mutex);
> >
> >         stuff();
> >
> > error_label;
> >         return;
> > }
> >
> > Which in this case it does run the mutex_unlock and NULL pointer.
> > Will try to find sometime to look at the generated assembly, but
> > this basically totally blows my mind. Very unclear as to if this
> > is supposed to work this way or just does by pure luck.
> >
> 
> As stated in cleanup.h, mixing goto-based cleanup and scope-based
> cleanup helpers in the same function is not expected, so I think
> we should keep a consistent approach here.

Right, and IIRC, clang would complain the mixed goto case at least
with W=1.


Takashi
