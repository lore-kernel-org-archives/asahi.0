Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129272F29
	for <asahi@lists.linux.dev>; Sun, 27 Nov 2022 23:19:45 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id EE62B26F404; Mon, 28 Nov 2022 00:12:06 +0100 (CET)
Date: Mon, 28 Nov 2022 00:12:06 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@svenpeter.dev>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: dwc3_set_mode vs. __dwc3_set_mode race
Message-ID: <20221127231206.GA5547@jannau.net>
References: <dad79707-a778-4868-8684-f1658a38b4d0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad79707-a778-4868-8684-f1658a38b4d0@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hej,

On 2022-11-26 10:10:48 +0100, Sven Peter wrote:
> Hi Thinh,
> 
> I've run into a race between dwc3_set_mode and __dwc3_set_mode accessing
> dwc->desired_dr_role: It's an incredibly tight race that's hard to hit since
> role switch events need to come in just after each other. It's reproducible
> with an Apple M1 connected to a device that very quickly switches
> roles when shutting down (which happens to be another M1). This sometimes
> triggers a device->host->device switch sequence which is fast enough to hit this
> race:
> 
> CPU A
> 	dwc3_set_mode(DWC3_GCTL_PRTCAP_HOST) // first role switch event
> 		spin_lock_irqsave(&dwc->lock, flags);
> 		dwc->desired_dr_role = mode; // DWC3_GCTL_PRTCAP_HOST
> 		spin_unlock_irqrestore(&dwc->lock, flags);
> 		queue_work(system_freezable_wq, &dwc->drd_work); // true, schedules __dwc3_set_mode
> 
> CPU B
> 	__dwc3_set_mode
> 		// ....
> 		spin_lock_irqsave(&dwc->lock, flags);
> 		dwc3_set_prtcap(dwc, dwc->desired_dr_role); // DWC3_GCTL_PRTCAP_HOST
> 		spin_unlock_irqrestore(&dwc->lock, flags);
> 
> CPU A
> 	dwc3_set_mode(DWC3_GCTL_PRTCAP_DEVICE) // second role switch event
> 		spin_lock_irqsave(&dwc->lock, flags);
> 		dwc->desired_dr_role = mode; // DWC3_GCTL_PRTCAP_DEVICE
> 		spin_unlock_irqrestore(&dwc->lock, flags);
> 
> CPU B (continues running __dwc3_set_mode)
> 	switch (dwc->desired_dr_role) { // DWC3_GCTL_PRTCAP_DEVICE
> 	case DWC3_GCTL_PRTCAP_HOST:
> 		// not executed since desired_dr_role is DWC3_GCTL_PRTCAP_DEVICE now
> 		break;
> 
> CPU A (continues running dwc3_set_mode)
> 	queue_work(system_freezable_wq, &dwc->drd_work); // __dwc3_set_mode is still running
> 
> CPU B (continues running __dwc3_set_mode)
> 	case DWC3_GCTL_PRTCAP_DEVICE:
> 		// ....
> 		ret = dwc3_gadget_init(dwc);
> 
> 
> We then have DWC3_GCTL.DWC3_GCTL_PRTCAPDIR = DWC3_GCTL_PRTCAP_HOST and
> dwc->current_dr_role = DWC3_GCTL_PRTCAP_HOST but initialized the controller in
> device mode when calling dwc3_gadget_init. This obviously doesn't work and is
> not easy to recover from.
> 
> Unfortunately we can't just lock dwc3->mutex since dwc3_set_mode may be called
> from an extcon interrupt in atomic context (which is probably the reason for
> deferring the mode switch to a workqueue).
> 
> Otherwise I can only think of creating a single-threaded work queue and
> allocating a new work_struct together with desired_role inside dwc3_set_mode
> and putting that onto the queue, i.e. something like:
> 
> struct dwc3_set_mode_work {
> 	struct dwc3 *dwc;
> 	u32 desired_dr_role;
> 	struct work_struct work;
> };
> 
> void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
> {
> 	struct dwc3_set_mode_work *work = kzalloc(sizeof(*work), GFP_ATOMIC);
> 
> 	INIT_WORK(&work->work, __dwc3_set_mode);
> 	work->dwc = dwc;
> 	work->desired_dr_role = mode;
> 	queue_work(dwc->drd_work_queue, &work->work);
> }
> 
> That way all role switch events will be executed in order and we can't race
> desired_dr_role anymore.
> I'm not very happy with that solution but can't think of anything else.
> 
> Any thoughts or ideas? I can otherwise prepare a patch.

your alternate solution to operate on a stack copy of 
dwc->desired_dr_role in __dwc3_set_mode() avoids this race and seems to 
work fine. Tested with 2 Apple silicon devices. Trivial patch left to 
the sender since I did just the trivial typing and testing.

thanks

Janne
